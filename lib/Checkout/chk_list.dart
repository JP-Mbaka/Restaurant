import 'dart:ffi';

import 'package:NatRest/Components.dart';
import 'package:NatRest/Controller/dbConnect.dart';
import 'package:NatRest/Controller/dbModel.dart';
import 'package:flutter/material.dart';
// import 'package:restaurant_order_app/Components.dart';
// import 'package:restaurant_order_app/Controller/dbConnect.dart';
// import 'package:restaurant_order_app/Controller/dbModel.dart';

class MyCheckList extends StatefulWidget {
  @override
  State<MyCheckList> createState() => _MyCheckListState();
}

class _MyCheckListState extends State<MyCheckList> {
  List<Order> orders = [];

  late Order sample;

  @override
  void initState() {
    sample = Order(
        id: "1",
        index: "2",
        foodname: "White Rice",
        foodprice: "200",
        qty: "1",
        total: "3000");
    orders.add(sample);
    orders.add(sample);
    orders.add(sample);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return orders.isEmpty
        ? const Center(
            child: Text('No Item on the cart'),
          )
        : ListView(
            children: orders.map((e) {
              return Container(
                width: 280,
                height: 80,
                margin: const EdgeInsets.only(left: 20, bottom: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                    ]),
                child: Row(children: [
                  Container(
                    height: 100,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/food/${e.id}.jpeg"))),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: QTY(
                      qty: int.parse(e.qty),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: SmallText(
                      text: '₦ ${e.foodprice}',
                      color: Colors.orangeAccent,
                    ),
                  )
                ]),
              );
            }).toList(),
          );
  }
}

class Order {
  String id;
  String index;
  String foodname;
  String foodprice;
  String qty;
  String total;

  Order({
    required this.id,
    required this.index,
    required this.foodname,
    required this.foodprice,
    required this.qty,
    required this.total,
  });
}
