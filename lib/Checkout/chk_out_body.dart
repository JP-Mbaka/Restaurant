import 'package:NatRest/Controller/dbModel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:restaurant_order_app/Checkout/chk_list.dart';
// import 'package:restaurant_order_app/Components.dart';

import '../Components.dart';
import 'chk_list.dart';

class CheckOut extends StatefulWidget {
  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              // margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                ],
              ),
              height: size.height * 0.45,
              child: MyCheckList(),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 60, right: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmallText(text: "Total"),
              BigText(
                text: Orderfields.sumTotal.toString(),
                color: Colors.orangeAccent,
              )
            ],
          ),
        ),
        ElevatedButton(
            onPressed: _launchURLInBrowser,
            style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                padding: const EdgeInsets.symmetric(horizontal: 50)),
            child: BigText(
              text: "Check Out",
              color: Colors.white,
            ))
      ],
    );
  }
}

_launchURLInBrowser() async {
  const url = 'https://paystack.com/pay/restaurant';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}
