import 'package:flutter/material.dart';
import 'package:restaurant_order_app/Components.dart';

class MyCheckList extends StatelessWidget {
  double? index;

  MyCheckList({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      //shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          width: 280,
          height: 80,
          margin: const EdgeInsets.only(left: 20, bottom: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, blurRadius: 5.0, offset: Offset(0, 5)),
            ],
          ),
          child: Row(
            children: [
              Container(
                height: 120,
                width: 100,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img7.jpg"))),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: QTY(),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: SmallText(text: '₦ 1200', color: Colors.orangeAccent,),
              )
            ],
          ),
        );
      },
    );
  }
}
