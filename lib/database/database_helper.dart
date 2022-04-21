import 'dart:io';
import 'package:notes_app/models/note_model.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static late DatabaseHelper _databaseHelper;
  static late Database _database;

  String noteTable = 'NotesTable';
  String id = 'id';
  String title = 'title';
  String description = 'description';
  String priority = 'priority';
  String date = 'date';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    _databaseHelper = DatabaseHelper._createInstance();
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initialiseDatabse();
    }
    return _database;
  }

  Future<Database> initialiseDatabse() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    return openDatabase(path, version: 1, onCreate: _createDb);
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $noteTable($id INTEGER PRIMARY KEY AUTOINCREMENT,$title TEXT,$description TEXT,$priority TEXT,$date TEXT)');
  }

  Future<List<Map<String, dynamic>>> getMapList() async {
    Database db = await database;

    var result = db.query(noteTable, orderBy: '$priority ASC');
    return result;
  }

  Future<int> insertNotes(Notes notes) async {
    Database db = await database;
    var result = db.insert(noteTable, notes.toMap());
    return result;
  }

  Future<int> updateNotes(Notes notes) async {
    Database db = await database;
    var result = db.update(noteTable, notes.toMap(),
        where: '$id = ?', whereArgs: [notes.id]);
    return result;
  }

  Future<int> getCount() async {
    Database db = await database;
    List<Map<String, dynamic>> x = await db.query(noteTable);
    int? result =  Sqflite.firstIntValue(x);
    return result!;
  }

  Future<int> deleteNotes(int _id) async {
    Database db = await database;
    var result = db.delete(noteTable, where: '$id = ?', whereArgs: [_id]);
    return result;
  }
}
