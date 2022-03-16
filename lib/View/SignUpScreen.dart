import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:shehzad_ecoomrce/Controller/LoginController.dart';
import 'package:shehzad_ecoomrce/Controller/SignUpController.dart';

import 'package:shehzad_ecoomrce/Helper/Components/PrimaryText.dart';
import 'package:shehzad_ecoomrce/Helper/Widgets/MyButton.dart';

import '../Helper/Widgets/MyTextField.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController rePasswordController = new TextEditingController();
  SignUpController signUpController = Get.put(SignUpController());
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
                PrimaryText(text: "Welcome \n Please Create Your Account!!"),
                Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTextField(
                      controller: emailController,
                      labelText: "Enter Email",
                      suffixIcon: Icon(Icons.email),
                    ),
                    Obx(
                      () => MyTextField(
                        suffixIcon: IconButton(
                          onPressed: () {
                            signUpController.ispassword.value =
                                !signUpController.ispassword.value;
                          },
                          icon: signUpController.ispassword.value
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        controller: passwordController,
                        labelText: "Enter Password",
                        obscuretext: signUpController.ispassword.value,
                      ),
                    ),
                    Obx(
                      () => MyTextField(
                        suffixIcon: IconButton(
                          onPressed: () {
                            signUpController.reIspassword.value =
                                !signUpController.reIspassword.value;
                          },
                          icon: signUpController.reIspassword.value
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        controller: rePasswordController,
                        labelText: "ReType Password",
                        obscuretext: signUpController.reIspassword.value,
                      ),
                    ),
                    MyButton(buttonName: "SignUp", onPressed: () {}),
                    MyButton(
                      buttonName: "Back To Login",
                      onPressed: () {
                        Get.back();
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
