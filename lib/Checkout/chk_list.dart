import 'package:NatRest/Components.dart';
import 'package:NatRest/Controller/dbConnect.dart';
import 'package:NatRest/Controller/dbModel.dart';
import 'package:flutter/material.dart';
// import 'package:restaurant_order_app/Components.dart';
// import 'package:restaurant_order_app/Controller/dbConnect.dart';
// import 'package:restaurant_order_app/Controller/dbModel.dart';

class MyCheckList extends StatelessWidget {
  double? index;

  MyCheckList({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Order>>(
      future: getOrders(),
      builder: (BuildContext context, AsyncSnapshot<List<Order>> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: Text('Loading ...'),
          );
        }
        return snapshot.data!.isEmpty
            ? const Center(
                child: Text('No Item on the cart'),
              )
            : ListView(
                children: snapshot.data!.map((e) {
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
                                    AssetImage("assets/images/${e.id}.jpeg"))),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: QTY(
                          qty: e.qty,
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
      },
    );
  }
}
