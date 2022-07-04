import 'package:flutter/material.dart';

import 'item_body.dart';

class ItemView extends StatelessWidget {
  String? id;
  String? food;
  String? price;

  ItemView({Key? key, this.id, this.food, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ItemBody(
          id: id,
          food: food,
          price: price,
        ),
      ),
    );
  }
}
