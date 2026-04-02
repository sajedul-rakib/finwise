import 'package:finwise/core/development/logger/error_logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase._init();
  static Database? _database;

  LocalDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('finwise_pro.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      // Increased version to 2 to trigger schema updates if you've already run version 1
      version: 2,
      onCreate: _createDB,
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < newVersion) {
          // Migration logic can be placed here in the future
        }
      },
    );
  }

  Future _createDB(Database db, int version) async {
    errorLogger(
      whichPlace: "inside _createDb function",
      where: "Local Database Service",
      extraMessage: "Initializing Database Schema",
    );

    // 1. Unified Categories Table
    // Using one table with a 'type' column is better than three separate tables.
    await db.execute('''
      CREATE TABLE categories (
        id TEXT PRIMARY KEY, 
        title TEXT NOT NULL, 
        icon TEXT NOT NULL,
        type TEXT NOT NULL -- 'expense' or 'savings'
      )
    ''');

    // 2. Transactions Table
    // Added 'title' and 'updatedAt' to match your TransactionModel
    await db.execute('''
      CREATE TABLE transactions (
        id TEXT PRIMARY KEY, 
        title TEXT NOT NULL,
        amount REAL NOT NULL, 
        categoryId TEXT NOT NULL, 
        type TEXT NOT NULL,
        createdAt TEXT NOT NULL, 
        updatedAt TEXT NOT NULL
      )
    ''');
  }

  // --- REUSABLE CRUD METHODS ---

  Future<int> insert(String table, Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert(
      table,
      row,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// [Sr. Dev Note]: This is the new flexible query function.
  /// It allows you to filter (WHERE), sort (ORDER BY), and limit results.
  Future<List<Map<String, dynamic>>> query(
    String table, {
    String? where,
    List<Object?>? whereArgs,
    String? orderBy,
    int? limit,
  }) async {
    final db = await instance.database;
    return await db.query(
      table,
      where: where,
      whereArgs: whereArgs,
      orderBy: orderBy,
      limit: limit,
    );
  }

  Future<List<Map<String, dynamic>>> transactionQueryByCategoryIdAndType({
    String? categoryId,
    String? transactionType,
  }) async {
    final db = await instance.database;

    return await db.rawQuery(
      '''
    SELECT t.*, c.icon AS icon FROM transactions t
    INNER JOIN categories c ON t.categoryId = c.id 
    WHERE t.categoryId = ? AND t.type = ?
    ''',
      [categoryId, transactionType],
    );
  }

  Future<List<Map<String, dynamic>>> queryAll(String table) async {
    final db = await instance.database;
    return await db.query(table);
  }

  Future<int> delete(String table, String id) async {
    final db = await instance.database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteDatabaseFile() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'finwise_pro.db');

    if (_database != null) {
      await _database!.close();
      _database = null;
    }

    await deleteDatabase(path);
  }
}
