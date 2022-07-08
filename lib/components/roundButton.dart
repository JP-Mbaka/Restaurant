import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundButton extends StatelessWidget {
  late String text;
  late final VoidCallback pressMe;
  // final Function press;

  RoundButton(this.text, this.pressMe, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      width: size.width * 0.8,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(25), child: newElevatedButtone()),
    );
  }

  Widget newElevatedButtone() {
    return ElevatedButton(
      child: Text(text),
      onPressed: pressMe,
      style: ElevatedButton.styleFrom(
        primary: Colors.orangeAccent,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        // ignore: prefer_const_constructors
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
