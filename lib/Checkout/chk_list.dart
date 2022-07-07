import 'package:NatRest/Components.dart';
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
  static int sumTotalHere = 0;

  List<Order> orders = Orderfields.orders;

  // late Order sample;

  @override
  void initState() {
    // sample = Order(
    //     id: "1",
    //     index: "2",
    //     foodname: "White Rice",
    //     foodprice: "200",
    //     qty: "1",
    //     total: "3000");
    // orders.add(sample);
    // orders.add(sample);
    // orders.add(sample);

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
              sumTotalHere = sumTotalHere + int.parse(e.total);
              Orderfields.sumTotal = sumTotalHere;
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
                            image:
                                AssetImage("assets/images/food/${e.id}.jpeg"))),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: SmallText(
                      text: '₦ ${e.foodprice}',
                      color: Colors.orangeAccent,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: SmallText(
                      text: '₦ ${e.total}',
                      color: Colors.orangeAccent,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            offset: Offset(0, 5)),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: SmallText(
                            size: 16,
                            text: e.qty.toString(),
                            color: Colors.orangeAccent,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: IconButton(
                            icon: const Icon(
                              Icons.delete_rounded,
                              size: 25,
                              color: Colors.orangeAccent,
                            ),
                            onPressed: () {
                              setState(() {
                                Orderfields.orders.removeWhere(
                                    (element) => element.id == e.id);

                                Orderfields.sumTotal =
                                    Orderfields.sumTotal - int.parse(e.total);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              );
            }).toList(),
          );
  }
}
