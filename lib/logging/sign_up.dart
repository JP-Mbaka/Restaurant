import 'package:NatRest/logging/sign_in.dart';
import 'package:flutter/material.dart';

import '../components/roundButton.dart';
import '../components/textfield.dart';

class SignUp extends StatelessWidget {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        // title: const Text('Sign Up'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        alignment: Alignment.center,
        height: size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Sign up',
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 25,
                      fontWeight: FontWeight.w600)),
              SizedBox(
                height: size.height * 0.05,
              ),
              TextInputCust(
                'Firstname',
                (value) {},
                Icons.person,
              ),
              TextInputCust(
                'Surname',
                (value) {},
                Icons.person_sharp,
              ),
              TextInputCust(
                'Mail',
                (value) {},
                Icons.mail_rounded,
              ),
              TextInputCust(
                'Mobile no',
                (value) {},
                Icons.phone,
              ),
              RoundButton(
                'Sign up',
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIn(),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
