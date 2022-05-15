// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shehzad_ecoomrce/Helper/Components/PrimaryText.dart';
import 'package:shehzad_ecoomrce/Helper/Widgets/MyButton.dart';
import 'package:shehzad_ecoomrce/View/Costomer_Portal/SignUpScreen.dart';

import '../../Controller/CustomerPortal/LoginController.dart';
import '../../Helper/Widgets/MyTextField.dart';

class LoginScreen extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());
  LoginScreen({Key? key}) : super(key: key);

  final _fromkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 75),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                PrimaryText(text: "Welcome \n Please SignIn"),
                SizedBox(
                  height: 50,
                ),
                Form(
                    key: _fromkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyTextField(
                          textInputAction: TextInputAction.next,
                          controller: loginController.emailController,
                          labelText: "Enter Email",
                          suffixIcon: Icon(Icons.email),
                        ),
                        Obx(
                          () => MyTextField(
                            textInputAction: TextInputAction.go,
                            suffixIcon: IconButton(
                              onPressed: () {
                                loginController.ispassword.value =
                                    !loginController.ispassword.value;
                              },
                              icon: loginController.ispassword.value
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                            controller: loginController.passwordController,
                            labelText: "Enter Password",
                            obscuretext: loginController.ispassword.value,
                          ),
                        ),
                        MyButton(
                          buttonName: "Login",
                          onPressed: () {
                            if (_fromkey.currentState!.validate()) {
                              loginController.logIn(
                                  loginController.emailController.text,
                                  loginController.passwordController.text);
                            }
                            return null;
                          },
                        ),
                        MyButton(
                          buttonName: "Create New Account",
                          onPressed: () {
                            Get.to(() => SignUpScreen());
                          },
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
