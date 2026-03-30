import SwiftUI
import WidgetKit

private enum SharedSessionConfig {
  static let appGroup = "group.com.altman.moviepilot.shared"
  static let serverKey = "shared_server_url"
  static let tokenKey = "shared_access_token"
}

private struct SharedSession {
  let server: String
  let accessToken: String
}

private struct SubscribeItemDTO: Decodable {
  let tmdbid: Int?
  let season: Int?
  let type: String?
  let name: String?
  let poster: String?

  private enum CodingKeys: String, CodingKey {
    case tmdbid
    case season
    case type
    case name
    case poster
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    tmdbid = Self.decodeInt(from: container, key: .tmdbid)
    season = Self.decodeInt(from: container, key: .season)
    type = try container.decodeIfPresent(String.self, forKey: .type)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    poster = try container.decodeIfPresent(String.self, forKey: .poster)
  }

  private static func decodeInt(
    from container: KeyedDecodingContainer<CodingKeys>,
    key: CodingKeys
  ) -> Int? {
    if let value = try? container.decodeIfPresent(Int.self, forKey: key) {
      return value
    }
    if let value = try? container.decodeIfPresent(String.self, forKey: key) {
      return Int(value)
    }
    return nil
  }
}

private struct TmdbEpisodeDTO: Decodable {
  let airDate: String?
  let episodeNumber: Int?
  let name: String?

  private enum CodingKeys: String, CodingKey {
    case airDate = "air_date"
    case episodeNumber = "episode_number"
    case name
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    airDate = try container.decodeIfPresent(String.self, forKey: .airDate)
    if let number = try? container.decodeIfPresent(Int.self, forKey: .episodeNumber) {
      episodeNumber = number
    } else if let number = try? container.decodeIfPresent(String.self, forKey: .episodeNumber) {
      episodeNumber = Int(number)
    } else {
      episodeNumber = nil
    }
    name = try container.decodeIfPresent(String.self, forKey: .name)
  }
}

private struct EpisodeCard: Identifiable {
  let id: String
  let date: String
  let showName: String
  let seasonNumber: Int
  let episodeNumber: Int
  let episodeTitle: String
  let posterURL: URL?
  let posterData: Data?
}

private struct SubscribeCalendarEntry: TimelineEntry {
  let date: Date
  let state: State

  enum State {
    case loaded([EpisodeCard])
    case empty(String)
    case failed(String)
  }
}

private struct SubscribeCalendarProvider: TimelineProvider {
  func placeholder(in context: Context) -> SubscribeCalendarEntry {
    SubscribeCalendarEntry(
      date: Date(),
      state: .loaded([
        EpisodeCard(
          id: "placeholder-1",
          date: "2026-03-30",
          showName: "片名示例",
          seasonNumber: 1,
          episodeNumber: 3,
          episodeTitle: "新的线索出现",
          posterURL: URL(string: "https://image.tmdb.org/t/p/w300/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg"),
          posterData: nil
        ),
        EpisodeCard(
          id: "placeholder-2",
          date: "2026-03-31",
          showName: "片名示例 2",
          seasonNumber: 2,
          episodeNumber: 1,
          episodeTitle: "季首播",
          posterURL: URL(string: "https://image.tmdb.org/t/p/w300/qJxzjUjCpTPvDHldNnlbRC4OqEh.jpg"),
          posterData: nil
        ),
      ])
    )
  }

  func getSnapshot(in context: Context, completion: @escaping (SubscribeCalendarEntry) -> Void) {
    Task {
      completion(await loadEntry())
    }
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<SubscribeCalendarEntry>) -> Void) {
    Task {
      let entry = await loadEntry()
      let refreshDate = Calendar.current.date(byAdding: .hour, value: 6, to: Date()) ?? Date().addingTimeInterval(21600)
      completion(Timeline(entries: [entry], policy: .after(refreshDate)))
    }
  }

  private func loadEntry() async -> SubscribeCalendarEntry {
    do {
      guard let session = SharedSessionStore.load() else {
        return SubscribeCalendarEntry(date: Date(), state: .empty("请先登录 MoviePilot"))
      }
      let items = try await SubscribeCalendarService(session: session).fetchUpcomingEpisodes()
      if items.isEmpty {
        return SubscribeCalendarEntry(date: Date(), state: .empty("今天之后暂无订阅更新"))
      }
      return SubscribeCalendarEntry(date: Date(), state: .loaded(items))
    } catch {
      return SubscribeCalendarEntry(date: Date(), state: .failed("订阅日历加载失败"))
    }
  }
}

private enum SharedSessionStore {
  static func load() -> SharedSession? {
    guard let defaults = UserDefaults(suiteName: SharedSessionConfig.appGroup) else {
      return nil
    }
    guard
      let server = defaults.string(forKey: SharedSessionConfig.serverKey)?.trimmingCharacters(in: .whitespacesAndNewlines),
      let accessToken = defaults.string(forKey: SharedSessionConfig.tokenKey)?.trimmingCharacters(in: .whitespacesAndNewlines),
      !server.isEmpty,
      !accessToken.isEmpty
    else {
      return nil
    }
    return SharedSession(server: server, accessToken: accessToken)
  }
}

private struct SubscribeCalendarService {
  let session: SharedSession

  func fetchUpcomingEpisodes() async throws -> [EpisodeCard] {
    let subscribes: [SubscribeItemDTO] = try await requestArray(path: "/api/v1/subscribe/")
    let tvSubscribes = subscribes.filter { subscribe in
      let value = (subscribe.type ?? "").trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
      return value == "tv" || value.contains("tv") || value.contains("电视剧")
    }

    var cards: [EpisodeCard] = []
    let today = utcToday()
    for subscribe in tvSubscribes {
      guard let tmdbId = subscribe.tmdbid, tmdbId > 0 else { continue }
      let season = max(subscribe.season ?? 1, 1)
      let episodes: [TmdbEpisodeDTO]
      do {
        episodes = try await requestArray(path: "/api/v1/tmdb/\(tmdbId)/\(season)")
      } catch {
        continue
      }
      let showName = (subscribe.name?.isEmpty == false) ? subscribe.name! : "剧集 \(tmdbId)"
      let posterURL = normalizedPosterURL(from: subscribe.poster)
      for episode in episodes {
        guard let airDate = episode.airDate, !airDate.isEmpty, airDate >= today else { continue }
        cards.append(
          EpisodeCard(
            id: "\(tmdbId)-\(season)-\(episode.episodeNumber ?? -1)-\(airDate)",
            date: airDate,
            showName: showName,
            seasonNumber: season,
            episodeNumber: episode.episodeNumber ?? 0,
            episodeTitle: episode.name?.isEmpty == false ? episode.name! : "待播出",
            posterURL: posterURL,
            posterData: nil
          )
        )
      }
    }

    cards.sort { lhs, rhs in
      if lhs.date == rhs.date {
        if lhs.showName == rhs.showName {
          return lhs.episodeNumber < rhs.episodeNumber
        }
        return lhs.showName < rhs.showName
      }
      return lhs.date < rhs.date
    }
    let limited = Array(cards.prefix(8))
    return await populatePosterData(for: limited)
  }

  private func requestArray<T: Decodable>(path: String) async throws -> [T] {
    let request = try buildRequest(path: path)
    let (data, response) = try await URLSession.shared.data(for: request)
    guard let httpResponse = response as? HTTPURLResponse else {
      throw URLError(.badServerResponse)
    }
    guard (200...299).contains(httpResponse.statusCode) else {
      throw URLError(.userAuthenticationRequired)
    }
    let decoder = JSONDecoder()
    if let decoded = try? decoder.decode([T].self, from: data) {
      return decoded
    }
    if
      let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
      let nested = json["data"],
      JSONSerialization.isValidJSONObject(nested)
    {
      let nestedData = try JSONSerialization.data(withJSONObject: nested)
      return try decoder.decode([T].self, from: nestedData)
    }
    return []
  }

  private func buildRequest(path: String) throws -> URLRequest {
    let baseURL = try normalizedBaseURL()
    guard let url = URL(string: path, relativeTo: baseURL) else {
      throw URLError(.badURL)
    }
    var request = URLRequest(url: url)
    request.timeoutInterval = 30
    request.setValue("application/json", forHTTPHeaderField: "accept")
    request.setValue("Bearer \(session.accessToken)", forHTTPHeaderField: "authorization")
    return request
  }

  private func populatePosterData(for cards: [EpisodeCard]) async -> [EpisodeCard] {
    await withTaskGroup(of: (String, Data?).self) { group in
      for card in cards {
        group.addTask {
          let data = await fetchPosterData(for: card.posterURL)
          return (card.id, data)
        }
      }

      var posterMap: [String: Data] = [:]
      for await (id, data) in group {
        if let data {
          posterMap[id] = data
        }
      }

      return cards.map { card in
        EpisodeCard(
          id: card.id,
          date: card.date,
          showName: card.showName,
          seasonNumber: card.seasonNumber,
          episodeNumber: card.episodeNumber,
          episodeTitle: card.episodeTitle,
          posterURL: card.posterURL,
          posterData: posterMap[card.id]
        )
      }
    }
  }

  private func fetchPosterData(for posterURL: URL?) async -> Data? {
    guard let posterURL else { return nil }
    let resolvedURL = proxiedImageURL(for: posterURL)
    var request = URLRequest(url: resolvedURL)
    request.timeoutInterval = 20
    request.setValue("Bearer \(session.accessToken)", forHTTPHeaderField: "authorization")
    request.setValue("image/*", forHTTPHeaderField: "accept")
    do {
      let (data, response) = try await URLSession.shared.data(for: request)
      guard let httpResponse = response as? HTTPURLResponse else { return nil }
      guard (200...299).contains(httpResponse.statusCode) else { return nil }
      return data
    } catch {
      return nil
    }
  }

  private func proxiedImageURL(for originalURL: URL) -> URL {
    let encoded = originalURL.absoluteString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? originalURL.absoluteString
    let rawBase = session.server.hasSuffix("/") ? String(session.server.dropLast()) : session.server
    if let proxyURL = URL(string: "\(rawBase)/api/v1/system/cache/image?url=\(encoded)") {
      return proxyURL
    }
    return originalURL
  }

  private func normalizedBaseURL() throws -> URL {
    let raw = session.server.hasSuffix("/") ? String(session.server.dropLast()) : session.server
    guard let url = URL(string: raw) else {
      throw URLError(.badURL)
    }
    return url
  }

  private func utcToday() -> String {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withFullDate]
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    return formatter.string(from: Date())
  }

  private func normalizedPosterURL(from raw: String?) -> URL? {
    guard let raw, !raw.isEmpty else { return nil }
    if raw.hasPrefix("http://") || raw.hasPrefix("https://") {
      return URL(string: raw)
    }
    if raw.hasPrefix("/") {
      return URL(string: "https://image.tmdb.org/t/p/w300\(raw)")
    }
    return nil
  }
}

struct SubscribeCalendarWidget: Widget {
  let kind = "SubscribeCalendarWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: SubscribeCalendarProvider()) { entry in
      SubscribeCalendarWidgetEntryView(entry: entry)
        .widgetURL(URL(string: "moviepilot://subscribe-calendar"))
    }
    .configurationDisplayName("订阅日历")
    .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
  }
}

private struct SubscribeCalendarWidgetEntryView: View {
  let entry: SubscribeCalendarEntry
  @Environment(\.widgetFamily) private var family

  var body: some View {
    content
      .padding(16)
      .background(Color(.systemBackground))
  }

  @ViewBuilder
  private var content: some View {
    switch entry.state {
    case .loaded(let items):
      loadedView(items: items)
    case .empty(let message):
      messageView(title: "订阅日历", message: message)
    case .failed(let message):
      messageView(title: "同步失败", message: message)
    }
  }

  private func loadedView(items: [EpisodeCard]) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      switch family {
      case .systemSmall:
        SmallCalendarView(items: items)
      case .systemLarge:
        LargeCalendarView(items: items)
      default:
        MediumCalendarView(items: items)
      }
    }
  }

  private func messageView(title: String, message: String) -> some View {
    VStack(alignment: .leading, spacing: 10) {
      Text(title)
        .font(.system(size: 18, weight: .bold))
        .foregroundStyle(.primary)
      Spacer()
      Text(message)
        .font(.system(size: 14, weight: .medium))
        .foregroundStyle(.secondary)
      Spacer()
    }
  }
}

private struct SmallCalendarView: View {
  let items: [EpisodeCard]

  var body: some View {
    let todayItems = items.filter { $0.date == utcToday() }

    return VStack(alignment: .leading, spacing: 10) {
        VStack(alignment: .leading, spacing: 4) {
          Text("今天订阅")
            .font(.system(size: 12, weight: .medium))
            .foregroundStyle(.secondary)
          Text("\(todayItems.count) 条更新")
            .font(.system(size: 20, weight: .bold))
            .foregroundStyle(.primary)
            .lineLimit(1)
          Text(todaySummary(from: todayItems))
            .font(.system(size: 11, weight: .medium))
            .foregroundStyle(.secondary)
            .lineLimit(3)
        }
    }
    .padding(.vertical, 2)
  }

  private func todaySummary(from todayItems: [EpisodeCard]) -> String {
    guard !todayItems.isEmpty else {
      return "今天暂无订阅更新"
    }
    let names = todayItems.prefix(3).map(\.showName)
    if todayItems.count > 3 {
      return names.joined(separator: "、") + " 等"
    }
    return names.joined(separator: "、")
  }

  private func utcToday() -> String {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withFullDate]
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    return formatter.string(from: Date())
  }
}

private struct MediumCalendarView: View {
  let items: [EpisodeCard]

  var body: some View {
    VStack(spacing: 6) {
      Spacer(minLength: 16)
      ForEach(Array(items.prefix(2))) { item in
        EpisodeRow(item: item, compact: false, showPoster: true)
      }
      Spacer(minLength: 16)
    }
  }
}

private struct LargeCalendarView: View {
  let items: [EpisodeCard]

  var body: some View {
    VStack(alignment: .leading, spacing: 6) {
      ForEach(Array(items.prefix(4))) { item in
        EpisodeRow(item: item, compact: false, showPoster: true)
      }
      Spacer(minLength: 0)
    }
  }
}

private struct EpisodeRow: View {
  let item: EpisodeCard
  let compact: Bool
  let showPoster: Bool

  var body: some View {
    HStack(alignment: .top) {
      if showPoster {
        PosterThumbnail(data: item.posterData, compact: compact)
      }
      VStack(alignment: .leading, spacing: 2) {
        Text(scheduleLabel)
          .font(.system(size: compact ? 11 : 12, weight: .medium))
          .foregroundStyle(.secondary)
          .lineLimit(1)
        Text(item.showName)
          .font(.system(size: compact ? 13 : 14, weight: .semibold))
          .foregroundStyle(.primary)
          .lineLimit(1)
        Text("S\(item.seasonNumber)E\(max(item.episodeNumber, 0)) · \(item.episodeTitle)")
          .font(.system(size: compact ? 11 : 12, weight: .medium))
          .foregroundStyle(.secondary)
          .lineLimit(compact ? 1 : 2)
      }
      Spacer(minLength: 0)
    }
    .padding(.horizontal, 12)
    .padding(.vertical, compact ? 7 : 8)
    .background(Color(.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
  }

  private var scheduleLabel: String {
    if item.date == utcToday() {
      return "今天"
    }
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.locale = Locale(identifier: "zh_CN")
    let displayFormatter = DateFormatter()
    displayFormatter.locale = Locale(identifier: "zh_CN")
    displayFormatter.dateFormat = "M月d日 EEE"
    guard let date = formatter.date(from: item.date) else {
      return item.date
    }
    return displayFormatter.string(from: date)
  }

  private func utcToday() -> String {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withFullDate]
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    return formatter.string(from: Date())
  }
}

private struct PosterThumbnail: View {
  let data: Data?
  let compact: Bool

  var body: some View {
    PosterBackground(data: data)
      .frame(width: compact ? 42 : 50, height: compact ? 56 : 66)
      .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
  }
}

private struct PosterBackground: View {
  let data: Data?

  var body: some View {
    ZStack {
      Color(.tertiarySystemFill)
      if let data, let uiImage = UIImage(data: data) {
        Image(uiImage: uiImage)
          .resizable()
          .scaledToFill()
      } else {
        placeholder
      }
    }
    .clipped()
  }

  private var placeholder: some View {
    ZStack {
      Color(.quaternarySystemFill)
      Image(systemName: "tv")
        .font(.system(size: 18, weight: .semibold))
        .foregroundStyle(.secondary)
    }
  }
}
