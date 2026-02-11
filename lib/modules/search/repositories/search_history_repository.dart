import 'package:get/get.dart';
import 'package:realm/realm.dart';

import '../../../services/realm_service.dart';
import '../models/search_history.dart';

class SearchHistoryRepository extends GetxService {
  SearchHistoryRepository({int maxEntries = 30})
    : _maxEntries = maxEntries < 5 ? 5 : maxEntries;

  static const int defaultFetchLimit = 20;

  final Realm _realm = Get.find<RealmService>().realm;
  final int _maxEntries;

  List<SearchHistoryEntry> load({int limit = defaultFetchLimit}) {
    final records = _realm.all<SearchHistoryEntry>().toList();
    records.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    if (limit <= 0 || records.length <= limit) {
      return records;
    }
    return records.take(limit).toList();
  }

  void save(String keyword) {
    final normalized = _normalize(keyword);
    if (normalized.isEmpty) return;

    final trimmed = keyword.trim();
    final now = DateTime.now();

    _realm.write(() {
      final existing = _realm.find<SearchHistoryEntry>(normalized);
      final createdAt = existing?.createdAt ?? now;
      final display = existing?.keyword ?? trimmed;

      _realm.add(
        SearchHistoryEntry(
          normalized,
          trimmed.isEmpty ? display : trimmed,
          createdAt,
          now,
        ),
        update: true,
      );
      _trimOverflow();
    });
  }

  void remove(String keyword) {
    final normalized = _normalize(keyword);
    if (normalized.isEmpty) return;

    final record = _realm.find<SearchHistoryEntry>(normalized);
    if (record == null) return;
    _realm.write(() {
      _realm.delete(record);
    });
  }

  void clearAll() {
    final records = _realm.all<SearchHistoryEntry>();
    if (records.isEmpty) return;
    _realm.write(() {
      _realm.deleteMany(records);
    });
  }

  void _trimOverflow() {
    final records = _realm.all<SearchHistoryEntry>().toList();
    if (records.length <= _maxEntries) return;

    records.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    final overflow = records.skip(_maxEntries);
    if (overflow.isEmpty) return;

    _realm.write(() {
      for (final item in overflow) {
        _realm.delete(item);
      }
    });
  }

  String _normalize(String keyword) => keyword.trim().toLowerCase();
}
