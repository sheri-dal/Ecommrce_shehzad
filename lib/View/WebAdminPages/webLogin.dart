// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shehzad_ecoomrce/Controller/WebAdminController/WebLoginController.dart';
import 'package:shehzad_ecoomrce/Helper/Components/PrimaryText.dart';
import 'package:shehzad_ecoomrce/Helper/Responsive_Work/sizeConfig.dart';
import 'package:shehzad_ecoomrce/Helper/Widgets/MyButton.dart';
import 'package:shehzad_ecoomrce/Helper/Widgets/MyTextField.dart';

class WebloginScreen extends StatelessWidget {
  static const id = "/Weblogin";
  var webLoginController = Get.put(WebLoginController());
  final _fromkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12)),
            child: Form(
              key: _fromkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryText(
                    text: "Login To Your Acoount Admin",
                  ),
                  MyTextField(
                      controller: webLoginController.userController,
                      labelText: "User Name",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "UserName Required";
                        }
                        return null;
                      }),
                  MyTextField(
                      controller: webLoginController.passwordController,
                      labelText: "Password",
                      obscuretext: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password Required";
                        }
                        return null;
                      }),
                  Obx(() => MyButton(
                        btnBordercolor: Colors.black,
                        buttonName: "buttonName",
                        onPressed: () {
                          if (_fromkey.currentState!.validate()) {
                            // webLoginController.isloading.value = true;

                            webLoginController.login(
                                webLoginController.userController.text,
                                webLoginController.passwordController.text);
                          }
                        },
                        btnColor: Colors.white,
                        btntrxtcolor: Colors.black,
                        isLoading: webLoginController.isloading.value,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
