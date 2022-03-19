// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shehzad_ecoomrce/Controller/LoginController.dart';
import 'package:shehzad_ecoomrce/Helper/Components/PrimaryText.dart';
import 'package:shehzad_ecoomrce/Helper/Widgets/MyButton.dart';
import 'package:shehzad_ecoomrce/View/SignUpScreen.dart';

import '../Helper/Widgets/MyTextField.dart';

class LoginScreen extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
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
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTextField(
                      textInputAction: TextInputAction.next,
                      controller: emailController,
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
                        controller: passwordController,
                        labelText: "Enter Password",
                        obscuretext: loginController.ispassword.value,
                      ),
                    ),
                    MyButton(
                      buttonName: "Login",
                      onPressed: () {},
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
