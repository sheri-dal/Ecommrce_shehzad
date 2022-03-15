import 'package:flutter/material.dart';
import 'package:shehzad_ecoomrce/Helper/Components/PrimaryText.dart';
import 'package:shehzad_ecoomrce/Helper/Widgets/MyButton.dart';

import '../Helper/Widgets/MyTextField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                PrimaryText(text: "Please \n SignIn"),
                Form(
                    child: Column(
                  children: [
                    MyTextField(
                      labelText: "Enter Email",
                    ),
                    MyTextField(
                      labelText: "Enter Password",
                    ),
                    MyButton(
                      buttonName: "Login",
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
