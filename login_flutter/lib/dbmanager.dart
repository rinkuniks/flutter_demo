import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbManager {
  Database _database;

  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(
          join(await getDatabasesPath(), "login_db.db"),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE user(id INTEGER PRIMARY KEY autoincrement, username TEXT, password TEXT)",
        );
      } );
    }
  }

  Future<int> insertUsers(User user) async {
    await openDb();
    return await _database.insert('user', user.toMap());
  }

  Future<List<User>> getUserList() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('user');
    return List.generate(maps.length, (i) {
      return User(
          id: maps[i]['id'], username: maps[i]['username'], password: maps[i]['password']);
    });
  }

  Future<int> updateUser(User user) async {
    await openDb();
    return await _database.update('user', user.toMap(),
        where: "id = ?", whereArgs: [user.id]);
  }

  Future<void> deleteUser(int id) async {
    await openDb();
    await _database.delete(
        'user',
        where: "id = ?", whereArgs: [id]
    );
  }
}

class User {
  int id;
  String username;
  String password;
  User({@required this.username, @required this.password, this.id});
  Map<String, dynamic> toMap() {
    return {'username': username, 'password': password};
  }
}