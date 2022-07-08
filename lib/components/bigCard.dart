import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  final textTitle;
  final textValue;
  BigCard(this.textTitle, this.textValue);

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // height: ,
      child: Card(
        child: Column(
          children: [
            Text(textTitle),
            Text(textValue),
          ],
        ),
      ),
    );
  }
}
