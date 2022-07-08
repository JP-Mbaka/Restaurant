import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputCust extends StatelessWidget {
  late final ValueChanged<String> onChanged;
  late final String hintText;
  late IconData icon;

  TextInputCust(this.hintText, this.onChanged, this.icon, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //Validation of Inputs comes here
    //And we need to ensure that only variables for email, phone numbers or mane structure are
    //Followed according to Nigerian System

    return Container(
      width: size.width * 0.8,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        // color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        style: const TextStyle(
          fontSize: 15,
          // color: Colors.orangeAccent,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            icon: Icon(icon),
            prefixIconColor: Colors.orangeAccent,
            labelText: hintText,
            labelStyle: const TextStyle(color: Colors.orangeAccent),
            // hintText: hintText,
            border: InputBorder.none),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onChanged: onChanged,
        // keyboardType: KeyboardListener.,
        //validator: ,
      ),
    );
  }
}
