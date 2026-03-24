import 'package:altman_totp/models/totp_profile.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TotpDb {
  static const _dbName = 'altman_totp.db';
  static const _table = 'totp_profiles';
  static const _version = 1;

  Database? _db;

  Future<Database> _database() async {
    if (_db != null) return _db!;
    final path = join(await getDatabasesPath(), _dbName);
    _db = await openDatabase(
      path,
      version: _version,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_table (
            id TEXT PRIMARY KEY,
            server TEXT NOT NULL,
            username TEXT NOT NULL,
            secret TEXT NOT NULL,
            issuer TEXT,
            digits INTEGER NOT NULL,
            period INTEGER NOT NULL,
            updated_at INTEGER NOT NULL
          )
        ''');
      },
    );
    return _db!;
  }

  Future<List<TotpProfile>> listAll() async {
    final db = await _database();
    final rows = await db.query(_table, orderBy: 'updated_at DESC');
    return rows.map((row) {
      return TotpProfile(
        id: row['id'] as String,
        server: row['server'] as String,
        username: row['username'] as String,
        secret: row['secret'] as String,
        issuer: row['issuer'] as String?,
        digits: (row['digits'] as num).toInt(),
        period: (row['period'] as num).toInt(),
        updatedAt: DateTime.fromMillisecondsSinceEpoch(
          (row['updated_at'] as num).toInt(),
        ),
      );
    }).toList();
  }

  Future<void> upsert(TotpProfile profile) async {
    final db = await _database();
    await db.insert(_table, {
      'id': profile.id,
      'server': profile.server,
      'username': profile.username,
      'secret': profile.secret,
      'issuer': profile.issuer,
      'digits': profile.digits,
      'period': profile.period,
      'updated_at': profile.updatedAt.millisecondsSinceEpoch,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> delete(String id) async {
    final db = await _database();
    await db.delete(_table, where: 'id = ?', whereArgs: [id]);
  }
}
