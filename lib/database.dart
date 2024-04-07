import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';

class DpHelper {
  Database? _database;

  DpHelper() {
    createDatabase();
  }

  Future<Database> createDatabase() async {
    if (_database != null) return _database!;
    _database = await openDatabase(
      'tx.dp',
      version:  1,
      onCreate: (database, version) async {
        print("database created");
        await database.execute(
          "CREATE TABLE user(id INTEGER PRIMARY KEY, First TEXT, Last TEXT, Email TEXT, password TEXT)",
        );
        print("table created");
      },
      onOpen: (database) {
        print("Opened database");
        // Assuming Getdata is a method you've defined elsewhere
        // getData(database);
      },
    );
    return _database!;
  }

  Future<void> insertToDatabase({
    required String first,
    required String last,
    required String email,
    required String password,
  }) async {
    await _database?.transaction((txn) async {
      return txn.execute(
        'INSERT INTO user (First, Last, Email, password) VALUES(?, ?, ?, ?)',
        [first, last, email, password],
      );
    }).then((value) {
      print("rows inserted");
      Fluttertoast.showToast(
        msg: 'Register successful',

        toastLength: Toast.LENGTH_LONG, // Duration for which the toast should be visible
        gravity: ToastGravity.BOTTOM, // Position of the toast on the screen
        timeInSecForIosWeb: 2, // Time for iOS
        backgroundColor: Color(0xFFD9D9D9),
        textColor: Colors.black,
        fontSize: 16.0,
      );
    }).catchError((onError) {
      print("${onError.toString()} the error is ");

    });
  }

  Future<String?> getPasswordByEmail(String email) async {
    List<Map<String, dynamic>> results = await _database?.query(
      'user',
      columns: ['password'],
      where: 'Email = ?',
      whereArgs: [email],
    ) ?? [];

    if (results.isNotEmpty) {
      return results.first['password'];
    }

    return null;
  }
}