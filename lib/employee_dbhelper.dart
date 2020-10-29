import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sample/employee_table.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io'as io;
import 'employee_table.dart';

class DBhelperEmployee{
  static Database _db;
  static const String Id='id';
  static const String Fname='fname';
  static const String Lname='lname';
  static const String Dept='dept';
  static const String Table='EmployeeTable';
  static const String DBName='Employee.db';

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
    await db.execute("CREATE TABLE $Table ($Id INTEGER PRIMARY KEY, $Fname TEXT,$Lname TEXT,$Dept TEXT)");
  }

  Future<Employee> save(Employee employee) async {
    var dbClient = await db;
    employee.id = await dbClient.insert(Table, employee.toMap());
    return employee;
  }
  Future<List<Employee>> getEmployee() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(Table, columns: [Id, Fname,Lname,Dept]);
    List<Employee> employees = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        employees.add(Employee.fromMap(maps[i]));
      }
    }
    return employees;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(Table, where: '$Id = ?', whereArgs: [id]);
  }

  Future<int> update(Employee employee) async {
    var dbClient = await db;
    return await dbClient.update(Table, employee.toMap(),
        where: '$Id = ?', whereArgs: [employee.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}