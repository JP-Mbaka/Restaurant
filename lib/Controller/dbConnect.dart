// import 'dart:io';
// import 'package:NatRest/Controller/dbModel.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class OrderDatabase {
//   static Stream<List<Order>> readUsers() => FirebaseFirestore.instance
//       .collection('nat')
//       .snapshots()
//       .map((event) => event.docs.map((e) => Order.fromJson(e.data())).toList());

//   static final OrderDatabase instance = OrderDatabase._init();

//   static Database? _database;

//   OrderDatabase._init();

//   Future<Database?> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDB('nat.db');

//     return _database;
//   }

//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filePath);

//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }

//   Future _createDB(Database db, int version) async {
//     final idType = 'INTEGER PRIMARY KEY';
//     final intType = 'INTEGER NOT NULL';
//     final textType = 'TEXT NOT NULL';

//     //   await db.execute('''
//     // CREATE TABLE $tableOrder (
//     // ${OrderFields.id} $idType,
//     // ${OrderFields.index} $intType,
//     // ${OrderFields.foodname} $textType,
//     // ${OrderFields.foodprice} $textType,
//     // ${OrderFields.qty} $intType,
//     // ${OrderFields.total} $intType,
//     // )
//     // ''');
//     await db.rawQuery('''create table $tableOrder(
//         ${OrderFields.id} $idType,
//         ${OrderFields.index} $intType,
//         ${OrderFields.foodname} $textType,
//         ${OrderFields.foodprice} $textType,
//         ${OrderFields.qty} $intType,
//         ${OrderFields.total} $intType );''');
//   }

//   Future<Order> create(Order order) async {
//     final db = await instance.database;

//     final id = await db!.insert(tableOrder, order.toJson());

//     return order.copy(id: id);
//   }

//   Future<List<Order>> readOrder() async {
//     final db = await instance.database;

//     final results = await db!.query(tableOrder);

//     return results.map((e) => Order.fromJson(e)).toList();
//   }

//   Future<int> update(Order order) async {
//     final db = await instance.database;

//     return db!.update(
//       tableOrder,
//       order.toJson(),
//       where: '${OrderFields.index} = ?',
//       whereArgs: [order.index],
//     );
//   }

//   Future<int> delete(int index) async {
//     final db = await instance.database;

//     return await db!.delete(
//       tableOrder,
//       where: '${OrderFields.index} = ?',
//       whereArgs: [index],
//     );
//   }

//   Future close() async {
//     final db = await instance.database;

//     db!.close();
//   }
// }


// // Future<Order> getOrder(int id, Database db) async {
// //   List<Map> results = await db
// // }
// // class Order {
// //   final int? index;
// //   final int? id;
// //   final String? foodname;
// //   final String? foodprice;
// //   final int? qty;
// //   final int? total;

// //   Order(
// //       {this.index,
// //       this.id,
// //       this.foodname,
// //       this.foodprice,
// //       this.qty,
// //       this.total});

// //   factory Order.fromMap(Map<String, dynamic> json) => Order(
// //       index: json['index'],
// //       id: json['id'],
// //       foodname: json['foodname'],
// //       foodprice: json['foodprice'],
// //       qty: json['qty'],
// //       total: json['total']);

// //   Map<String, dynamic> toMap() {
// //     return {
// //       'index': index,
// //       'id': id,
// //       'foodname': foodname,
// //       'foodprice': foodprice,
// //       'qty': qty,
// //       'total': total,
// //     };
// //   }
// // }

// // class DatabaseHelper {
// //   DatabaseHelper._privateConstructor();
// //   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

// //   static Database? _database;
// //   Future<Database> get database async => _database ??= await _initDatabase();

// //   Future<Database> _initDatabase() async {
// //     Directory documentsDirectory = await getApplicationDocumentsDirectory();
// //     String path = join(documentsDirectory.path, 'natOrder.db');
// //     return await openDatabase(path, version: 1, onCreate: _onCreate);
// //   }
// // }

// // Future _onCreate(Database db, int version) async {
// //   await db.execute('CREATE TABLE order (index	INTEGER PRIMARY KEY, id	INTEGER,foodname	TEXT, foodprice	TEXT, qty	INTEGER, total	INTEGER)');
// //   // await db.execute(
// //   //   "CREATE TABLE books(id INTEGER PRIMARY KEY, title TEXT, price INTEGER)",
// //   // );
// // }

// // Future<List<Order>> getOrders() async {
// //   Database db = await DatabaseHelper.instance.database;
// //   var orders = await db.query('order');
// //   List<Order> orderList =
// //       orders.isNotEmpty ? orders.map((e) => Order.fromMap(e)).toList() : [];
// //   return orderList;
// // }
