import 'package:NatRest/Components.dart';
import 'package:NatRest/Dashboard/main_dashboard.dart';
import 'package:NatRest/logging/sign_up.dart';
import 'package:flutter/material.dart';

import '../components/roundButton.dart';
import '../components/textfield.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        // title: const Text('Sign in'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
          height: size.height,
          width: double.infinity,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.orangeAccent,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                TextInputCust(
                  'Username',
                  (vale) {},
                  Icons.person_rounded,
                ),
                TextInputCust(
                  'Password',
                  (vale) {},
                  Icons.password_rounded,
                ),
                RoundButton(
                  'Login',
                  () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Homeview(),
                        ));
                  },
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(text: 'Don\'t have an account?'),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ));
                      },
                      child: SmallText(
                        text: 'SignUp',
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
