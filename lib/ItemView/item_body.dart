import 'package:flutter/material.dart';
import 'package:restaurant_order_app/Checkout/chk_out.dart';
import 'package:restaurant_order_app/Components.dart';
import 'package:restaurant_order_app/Dashboard/body.dart';
import 'package:restaurant_order_app/Dashboard/recommend.dart';

class ItemBody extends StatelessWidget {
  int qty = 1;
  String? id;
  String? food;
  String? price;

  ItemBody({Key? key, this.id, this.food, this.price}) : super(key: key);

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // String img =
    return Column(
      children: [
        Container(
          height: size.height * 0.45,
          padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.only(to),
            color: Colors.cyanAccent,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/food/$id.jpeg"),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                  Icons.arrow_back_rounded,
                  color: Colors.orangeAccent,
                ),
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => CheckoutMain())))
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
        ),
        //Container for below
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              // margin: const EdgeInsets.only(top: 0, left: 5, right: 5),
              height: size.height * 0.90,
              padding: const EdgeInsets.only(left: 0, right: 0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  BigText(
                    text: food.toString(),
                    color: Colors.black87,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BigText(text: 'Description'),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: SmallText(
                        text:
                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //QTY BTN and Button tag
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: QTY(
                          qty: qty,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Add_to_Cart(
                          price: price,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BigText(
                    text: 'Recommendation',
                    color: Colors.black87,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.only(left: 30, right: 20),
                    child: const Recommend(),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
