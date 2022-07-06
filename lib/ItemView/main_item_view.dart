import 'package:flutter/material.dart';

import 'item_body.dart';

class ItemView extends StatefulWidget {
  String? id;
  String? food;
  String? price;

  ItemView({Key? key, this.id, this.food, this.price}) : super(key: key);

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ItemBody(
          id: widget.id,
          food: widget.food,
          price: widget.price,
        ),
      ),
    );
  }
}
