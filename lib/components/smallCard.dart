import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SmallCards extends StatelessWidget {
  final descTitle;
  final descValue;
  final IconData icon;

  const SmallCards(this.descTitle,this.descValue,{Key? key, required this.icon}) : super(key: key);
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Card(
        child: Column(
          children: [
            Icon(icon),
            Text(descTitle),
            Text(descValue),
          ],
        ),
      ),
    );
  }
}
