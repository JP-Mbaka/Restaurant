import 'package:flutter/material.dart';
// import 'package:restaurant_order_app/Checkout/chk_out_body.dart';

import 'chk_list.dart';
import 'chk_out_body.dart';

class CheckoutMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          backgroundColor: Colors.orangeAccent,
        ),
        body: CheckOut(),
      ),
    );
  }
}
