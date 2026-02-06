/// 热门订阅/订阅分享 筛选选项
class SubscribePopularSortOption {
  const SubscribePopularSortOption({required this.label, required this.value});

  final String label;
  final String value;
}

class SubscribePopularFilterDefines {
  /// 排序：最新、热门、评分
  static const List<SubscribePopularSortOption> sortOptions = [
    SubscribePopularSortOption(label: '最新', value: 'time'),
    SubscribePopularSortOption(label: '热门', value: 'count'),
    SubscribePopularSortOption(label: '评分', value: 'rating'),
  ];

  /// 风格选项（电视剧）
  static const List<Map<String, String>> tvGenreOptions = [
    {'label': '动画', 'value': '16'},
    {'label': '剧情', 'value': '18'},
    {'label': '喜剧', 'value': '35'},
    {'label': '犯罪', 'value': '80'},
    {'label': '纪录片', 'value': '99'},
    {'label': '悬疑', 'value': '9648'},
    {'label': '家庭', 'value': '10751'},
    {'label': '动作冒险', 'value': '10759'},
    {'label': '科幻奇幻', 'value': '10765'},
  ];

  /// 风格选项（电影）
  static const List<Map<String, String>> movieGenreOptions = [
    {'label': '冒险', 'value': '12'},
    {'label': '奇幻', 'value': '14'},
    {'label': '动画', 'value': '16'},
    {'label': '剧情', 'value': '18'},
    {'label': '动作', 'value': '28'},
    {'label': '喜剧', 'value': '35'},
    {'label': '惊悚', 'value': '53'},
    {'label': '科幻', 'value': '878'},
    {'label': '悬疑', 'value': '9648'},
    {'label': '爱情', 'value': '10749'},
  ];

  /// 评分选项
  static const List<Map<String, String>> ratingOptions = [
    {'label': '不限', 'value': '0'},
    {'label': '6分+', 'value': '6'},
    {'label': '7分+', 'value': '7'},
    {'label': '8分+', 'value': '8'},
  ];
}
