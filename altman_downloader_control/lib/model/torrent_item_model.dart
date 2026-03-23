/// 通用的种子数据模型
/// 统一 qBittorrent 和 Transmission 的种子数据格式
class TorrentModel {
  final String hash;
  final String name;
  final int size;
  final int totalSize;
  final double progress;
  final int dlspeed;
  final int upspeed;
  final int priority;
  final int numSeeds;
  final int numLeechers;
  final int numComplete;
  final int numIncomplete;
  final double ratio;
  final double popularity;
  final int eta;
  final String state;
  final String category;
  final List<String> tags;
  final int addedOn;
  final int completionOn;
  final int lastActivity;
  final int seenComplete;
  final String savePath;
  final String contentPath;
  final String downloadPath;
  final String rootPath;
  final int downloaded;
  final int completed;
  final int uploaded;
  final int downloadedSession;
  final int uploadedSession;
  final int amountLeft;
  final String tracker;
  final String comment;
  final String magnetUri;
  final double availability;
  final double dlLimit;
  final double upLimit;
  final double timeActive;
  final int seedingTime;

  TorrentModel({
    required this.hash,
    required this.name,
    required this.size,
    required this.totalSize,
    required this.progress,
    required this.dlspeed,
    required this.upspeed,
    required this.priority,
    required this.numSeeds,
    required this.numLeechers,
    required this.numComplete,
    required this.numIncomplete,
    required this.ratio,
    required this.popularity,
    required this.eta,
    required this.state,
    required this.category,
    required this.tags,
    required this.addedOn,
    required this.completionOn,
    required this.lastActivity,
    required this.seenComplete,
    required this.savePath,
    required this.contentPath,
    required this.downloadPath,
    required this.rootPath,
    required this.downloaded,
    required this.completed,
    required this.uploaded,
    required this.downloadedSession,
    required this.uploadedSession,
    required this.amountLeft,
    required this.tracker,
    required this.comment,
    required this.magnetUri,
    required this.availability,
    required this.dlLimit,
    required this.upLimit,
    required this.timeActive,
    required this.seedingTime,
  });

  /// 从 QBTorrentModel 转换
  factory TorrentModel.fromQBTorrentModel(dynamic qbTorrent) {
    return TorrentModel(
      hash: qbTorrent.hash,
      name: qbTorrent.name,
      size: qbTorrent.size,
      totalSize: qbTorrent.totalSize,
      progress: qbTorrent.progress,
      dlspeed: qbTorrent.dlspeed,
      upspeed: qbTorrent.upspeed,
      priority: qbTorrent.priority,
      numSeeds: qbTorrent.numSeeds,
      numLeechers: qbTorrent.numLeechers,
      numComplete: qbTorrent.numComplete,
      numIncomplete: qbTorrent.numIncomplete,
      ratio: qbTorrent.ratio,
      popularity: qbTorrent.popularity,
      eta: qbTorrent.eta,
      state: qbTorrent.state,
      category: qbTorrent.category,
      tags: qbTorrent.tags,
      addedOn: qbTorrent.addedOn,
      completionOn: qbTorrent.completionOn,
      lastActivity: qbTorrent.lastActivity,
      seenComplete: qbTorrent.seenComplete,
      savePath: qbTorrent.savePath,
      contentPath: qbTorrent.contentPath,
      downloadPath: qbTorrent.downloadPath,
      rootPath: qbTorrent.rootPath,
      downloaded: qbTorrent.downloaded,
      completed: qbTorrent.completed,
      uploaded: qbTorrent.uploaded,
      downloadedSession: qbTorrent.downloadedSession,
      uploadedSession: qbTorrent.uploadedSession,
      amountLeft: qbTorrent.amountLeft,
      tracker: qbTorrent.tracker,
      comment: qbTorrent.comment,
      magnetUri: qbTorrent.magnetUri,
      availability: qbTorrent.availability,
      dlLimit: qbTorrent.dlLimit,
      upLimit: qbTorrent.upLimit,
      timeActive: qbTorrent.timeActive,
      seedingTime: qbTorrent.seedingTime,
    );
  }

  /// 转换为 QBTorrentModel（兼容性方法）
  dynamic toQBTorrentModel() {
    // 导入 QBTorrentModel 并创建实例
    // 这里需要导入 QBTorrentModel，但为了解耦，我们返回一个 Map
    // 或者让 QBTorrentModel 提供一个 fromTorrentModel 方法
    throw UnimplementedError('Use QBTorrentModel.fromTorrentModel instead');
  }

  // 便捷方法
  bool get isDownloading => state == 'downloading';
  bool get isSeeding => state == 'seeding';
  bool get isPaused => state == 'paused' || state == 'stopped';
  bool get hasError => state.contains('error') || state == 'missingFiles';
}
