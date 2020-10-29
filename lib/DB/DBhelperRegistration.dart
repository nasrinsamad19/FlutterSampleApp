import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/DB/RegTable.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io'as io;

class DBHelperRegistration {
  static Database _db;
  static const String Id = 'id';
  static const String name = 'name';
  static const String email = 'email';
  static const String phoneNo = 'phoneNo';
  static const String gender = 'gender';
  static const String Table = 'RegistrationTable';
  static const String DBName = 'Registration.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DBName);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $Table ($Id INTEGER PRIMARY KEY, $name TEXT,$email TEXT,$phoneNo INTEGER,$gender TEXT)");
  }

  Future<Registration> save(Registration registration) async {
    var dbClient = await db;
    registration.id = await dbClient.insert(Table, registration.toMap());
    return registration;
  }

  Future<List<Registration>> getData() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(
        Table, columns: [Id, name, email, phoneNo, gender]);
    List<Registration> reg = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        reg.add(Registration.fromMap(maps[i]));
      }
    }
    return reg;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(Table, where: '$Id = ?', whereArgs: [id]);
  }

  Future<int> update(Registration registration) async {
    var dbClient = await db;
    return await dbClient.update(Table, registration.toMap(),
        where: '$Id = ?', whereArgs: [registration.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }

}