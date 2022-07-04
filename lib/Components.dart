import 'dart:ui';

import 'package:flutter/material.dart';

class QTY_s extends StatelessWidget {
  const QTY_s({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 5.0, offset: Offset(0, 5)),
        ],
      ),
      child: Row(
        children: [
          Container(
            // margin: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.remove_rounded,
              size: 20,
              color: Colors.orangeAccent,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 5),
            child: SmallText(
              text: '2',
              color: Colors.orangeAccent,
            ),
          ),
          Container(
            child: Icon(
              Icons.add_rounded,
              size: 20,
              color: Colors.orangeAccent,
            ),
          ),
        ],
      ),
    );
  }
}

class Add_to_Cart extends StatelessWidget {
  String? price;

  Add_to_Cart({Key? key, this.price}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 5.0, offset: Offset(0, 5)),
        ],
      ),
      child: Row(
        children: [
          BigText(
            text: '₦ $price',
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          BigText(
            text: 'Add to Cart',
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class QTY extends StatelessWidget {
  late int? qty;

  QTY({Key? key, this.qty}) : super(key: key);

  int add(int i) {
    return i + 1;
  }

  int sub(int i) {
    if (i != 1) {
      i = i - 1;
    }
    return i;
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 5.0, offset: Offset(0, 5)),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.remove_rounded,
              size: 25,
              color: Colors.orangeAccent,
            ),
          ),
          GestureDetector(
            onTap: () => {sub(qty!)},
            child: Container(
              margin: EdgeInsets.only(right: 15),
              child: BigText(
                text: qty.toString(),
                color: Colors.orangeAccent,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {add(qty!)},
            child: Container(
              child: Icon(
                Icons.add_rounded,
                size: 25,
                color: Colors.orangeAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  Color? color;
  late final String text;
  late double size;
  late double height;

  SmallText(
      {Key? key,
      required this.text,
      this.color = Colors.black38,
      this.size = 12,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        height: height,
      ),
    );
  }
}

class BigText extends StatelessWidget {
  Color? color;
  late final String text;
  late double? size;

  BigText({
    Key? key,
    this.color = Colors.black45,
    required this.text,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: size),
    );
  }
}

class InputText extends StatelessWidget {
  late IconData icon;
  late String hint;

  InputText({Key? key, IconData? icon, String? hint}) : super(key: key) {
    this.hint = hint!;
    this.icon = icon!;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon, //Icons.search_rounded,
          size: 25,
          color: Colors.orangeAccent,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        prefixIconColor: Colors.orangeAccent,
        hintText: hint,
        hintStyle: TextStyle(color: Color.fromARGB(137, 255, 172, 64)),
      ),
    );
  }
}
