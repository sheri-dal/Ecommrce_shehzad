// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shehzad_ecoomrce/Controller/GeneralController.dart';
import 'package:shehzad_ecoomrce/Controller/SignUpController.dart';

import 'package:shehzad_ecoomrce/Helper/Components/PrimaryText.dart';
import 'package:shehzad_ecoomrce/Helper/Widgets/MyButton.dart';

import '../Helper/Widgets/MyTextField.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController rePasswordController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
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
                PrimaryText(text: "Welcome \n Create Your Account!!"),
                Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "req";
                            }
                            var email = GeneralMethod.isEmailValid(value);

                            if (!email) {
                              return "Email Not Valid";
                            }
                            return null;
                          },
                          controller: emailController,
                          labelText: "Enter Email",
                          suffixIcon: Icon(Icons.email),
                        ),
                        Obx(
                          () => MyTextField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password Required";
                              }
                              var pass = GeneralMethod.isPasseord(value);
                              if (!pass) {
                                return "Password Not Valid";
                              }
                              return null;
                            },
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password Required";
                              } else if (value.length < 7) {
                                return "Password Short";
                              }
                              return null;
                            },
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
                        MyButton(
                            buttonName: "SignUp",
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                signUpController.log(
                                    emailController.text,
                                    passwordController.text,
                                    rePasswordController.text);
                              }
                            }),
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
