import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:restaurant_order_app/Components.dart';
// import 'package:restaurant_order_app/Dashboard/body.dart';

import '../Controller/cusines.dart';
import 'body.dart';

class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _itemsView();
  }
}

class _itemsView extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
        body: Body(),//BigText(text: 'Hello',)
      );
  }
}
