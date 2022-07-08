import 'package:flutter/material.dart';

import 'components/body.dart';

class Welcom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
      body: BodyWelcome(),
    ),);
  }
}
