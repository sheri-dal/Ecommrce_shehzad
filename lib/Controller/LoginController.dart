import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shehzad_ecoomrce/Controller/BaseController.dart';
import 'package:shehzad_ecoomrce/View/HomeScreen.dart';

import '../Helper/Components/dialog_helper.dart';

class LoginController extends BaseController {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  var ispassword = true.obs;
  var isDataLoading = false.obs;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void logIn(String email, String password) {
    DialogHelper.showLoading("Loading");

    LoginAccount(email, password).then((res) {
      DialogHelper.hideLoading();
      if (res == null) {
        print(res);
        Get.to(() => HomeScreen());
      } else {
        DialogHelper.hideLoading();
        DialogHelper.showErroDialog(title: "Login Failed !!", description: res);

        isDataLoading.value = false;
      }
    });
  }

  Future<String?> LoginAccount(String email, String password) async {
    isDataLoading.value = true;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  static Future<Void?> signOut() async {
    await FirebaseAuth.instance.signOut();
    return null;
  }
}
