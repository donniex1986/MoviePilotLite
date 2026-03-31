import SwiftUI
import WidgetKit
import AppIntents

@available(iOSApplicationExtension 17.0, *)
struct SubscribeCalendarWidgetIntent: WidgetConfigurationIntent {
  static var title: LocalizedStringResource = "订阅日历"
  static var description = IntentDescription("展示今天及之后的订阅更新")
}

@available(iOSApplicationExtension 17.0, *)
struct RecommendTrendingWidgetIntent: WidgetConfigurationIntent {
  static var title: LocalizedStringResource = "影视推荐"
  static var description = IntentDescription("展示豆瓣热门影视推荐")
}

@available(iOSApplicationExtension 17.0, *)
struct SubscribeCalendarAppIntentProvider: AppIntentTimelineProvider {
  typealias Entry = SubscribeCalendarEntry
  typealias Intent = SubscribeCalendarWidgetIntent

  func placeholder(in context: Context) -> SubscribeCalendarEntry {
    SubscribeCalendarProvider().placeholder(in: context)
  }

  func snapshot(
    for configuration: SubscribeCalendarWidgetIntent,
    in context: Context
  ) async -> SubscribeCalendarEntry {
    await SubscribeCalendarProvider.loadEntry()
  }

  func timeline(
    for configuration: SubscribeCalendarWidgetIntent,
    in context: Context
  ) async -> Timeline<SubscribeCalendarEntry> {
    let entry = await SubscribeCalendarProvider.loadEntry()
    let refreshDate = Calendar.current.date(byAdding: .hour, value: 6, to: Date()) ?? Date().addingTimeInterval(21600)
    return Timeline(entries: [entry], policy: .after(refreshDate))
  }
}

@available(iOSApplicationExtension 17.0, *)
struct RecommendTrendingAppIntentProvider: AppIntentTimelineProvider {
  typealias Entry = RecommendTrendingEntry
  typealias Intent = RecommendTrendingWidgetIntent

  func placeholder(in context: Context) -> RecommendTrendingEntry {
    RecommendTrendingProvider().placeholder(in: context)
  }

  func snapshot(
    for configuration: RecommendTrendingWidgetIntent,
    in context: Context
  ) async -> RecommendTrendingEntry {
    await RecommendTrendingProvider.loadEntry()
  }

  func timeline(
    for configuration: RecommendTrendingWidgetIntent,
    in context: Context
  ) async -> Timeline<RecommendTrendingEntry> {
    let entry = await RecommendTrendingProvider.loadEntry()
    let refreshDate = Calendar.current.date(byAdding: .hour, value: 6, to: Date()) ?? Date().addingTimeInterval(21600)
    return Timeline(entries: [entry], policy: .after(refreshDate))
  }
}
