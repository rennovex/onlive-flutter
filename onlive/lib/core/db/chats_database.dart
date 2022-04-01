import 'dart:async';

import '../../Features/Chat/domain/entitites/chat.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ChatsDatabase {
  static final ChatsDatabase instance = ChatsDatabase._init();

  static Database? _database;

  ChatsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('chats2.db');
    return database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  FutureOr<void> _createDB(Database db, int version) async {
    final idType = "TEXT PRIMARY KEY";
    final textType = "TEXT NOT NULL";
    final integerType = "INTEGER NOT NULL";

    await db.execute('''
CREATE TABLE $tableChats ( 
  ${ChatFields.id} $idType, 
  ${ChatFields.from} $textType, 
  ${ChatFields.to} $textType, 
  ${ChatFields.body} $textType, 
  ${ChatFields.status} $textType, 
  ${ChatFields.timeStamp} $textType, 
  ${ChatFields.v} $integerType
);
''');
    print('table created.');
  }

  Future<Chat> create(Chat chat) async {
    final db = await instance.database;
    await db.insert(tableChats, chat.toJson());
    return chat;
  }

  Future<List<dynamic>> readAllChats() async {
    final db = await instance.database;

    final result = await db.query(tableChats);
    print(result[0]);
    return result;
    // return result.toString();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
