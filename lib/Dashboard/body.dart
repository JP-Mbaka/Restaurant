import 'package:flutter/material.dart';
import 'package:restaurant_order_app/Checkout/chk_out.dart';
import 'package:restaurant_order_app/Components.dart';
import 'package:restaurant_order_app/Dashboard/Items_list.dart';
import 'package:restaurant_order_app/Dashboard/recommend.dart';

class Body extends StatelessWidget {
  late String greeting;
  TimeOfDay now = TimeOfDay.now();

  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (now.hour < 12) {
      greeting = "Good Morning";
    } else if (now.hour >= 12 && now.hour < 16) {
      greeting = "Good Afternoon";
    } else {
      greeting = "Good Evening";
    }
    return Column(
      children: [
        Container(
          height: size.height * 0.18,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          decoration: const BoxDecoration(
            boxShadow: [
              //color: Colors.white, //background color of box
              BoxShadow(
                color: Colors.white,
                blurRadius: 10.0, // soften the shadow
                spreadRadius: 5.0, //extend the shadow
                offset: Offset(
                  0, // Move to right 10  horizontally
                  7, // Move to bottom 10 Vertically
                ),
              )
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: greeting),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => CheckoutMain())))
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                              offset: Offset(0, 5)),
                        ],
                      ),
                      child: const Icon(
                        Icons.shopping_cart_rounded,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              InputText(
                hint: 'Search keyword',
                icon: Icons.search_rounded,
              ),
            ],
          ),
        ),
        const Recommend(),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BigText(
                text: 'Popular',
                color: Colors.black,
              ),
              SmallText(text: 'Most ordered cousines on the menu')
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            // padding: const EdgeInsets.all(10),
            child: Container(
              margin: const EdgeInsets.only(bottom: 5),
              padding: const EdgeInsets.only(bottom: 20, right: 20),
              height: 320,
              child: MyListItems(),
            ),
          ),
        )
      ],
    );
  }
}
