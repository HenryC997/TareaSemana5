import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/computadora.dart';

class DBHelper {
  static const String tableName = "computadoras";

  static Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'computadoras.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            procesador TEXT,
            discoDuro TEXT,
            ram INTEGER
          )
          ''',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertComputadora(Computadora computadora) async {
    final db = await _initDatabase();
    await db.insert(tableName, computadora.toMap());
  }

  static Future<List<Computadora>> fetchComputadoras() async {
    final db = await _initDatabase();
    final maps = await db.query(tableName);
    return List.generate(maps.length, (i) => Computadora.fromMap(maps[i]));
  }

  static Future<void> updateComputadora(Computadora computadora) async {
    final db = await _initDatabase();
    await db.update(
      tableName,
      computadora.toMap(),
      where: 'id = ?',
      whereArgs: [computadora.id],
    );
  }

  static Future<void> deleteComputadora(int id) async {
    final db = await _initDatabase();
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
