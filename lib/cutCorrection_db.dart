import 'package:flutter/cupertino.dart';
import 'package:postgres/postgres.dart';

List<List<dynamic>> studTable = [];
List<List<dynamic>> table2 = [];

class Dbhelper {
  final connection = PostgreSQLConnection(
    "localhost",
    5432,
    "cutCorrectionDB",
    username: "postgres",
    password: "MustardButt?!3",
  );

  Future<void> initDb() async {
    try {
      await connection.open();
      debugPrint("Database Connected!");
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  Future<void> getData() async {
    var student = await connection.query("SELECT * FROM public.student");
    for (var row in student) {
      studTable.add(row);
    }
  }
}
