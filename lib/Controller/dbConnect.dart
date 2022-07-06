import 'dart:io';

import 'package:NatRest/Controller/dbModel.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:restaurant_order_app/Controller/dbModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:collection/collection.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'natOrder.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }
}

Future _onCreate(Database db, int version) async {
  await db.execute('''
  CREATE TABLE "order" (
	index	INTEGER,
	id	INTEGER,
	foodname	TEXT,
	foodprice	TEXT,
	qty	INTEGER,
	total	INTEGER
)
''');
}

Future<List<Order>> getOrders() async {
  Database db = await DatabaseHelper.instance.database;
  var orders = await db.query('order', orderBy: 'index');
  List<Order> orderList =
      orders.isNotEmpty ? orders.map((e) => Order.fromMap(e)).toList() : [];
  return orderList;
}
