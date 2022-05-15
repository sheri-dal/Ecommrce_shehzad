import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shehzad_ecoomrce/Controller/BaseController.dart';
import 'package:shehzad_ecoomrce/Helper/Components/dialog_helper.dart';

import '../../View/Costomer_Portal/HomeScreen.dart';

class SignUpController extends BaseController {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController rePasswordController = new TextEditingController();
  var ispassword = true.obs;
  var reIspassword = true.obs;
  var isDataLoading = false.obs;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
  }

  void SignUp(String email, String password, String retypePassword) {
    DialogHelper.showLoading("Loading");
    if (password != retypePassword) {
      DialogHelper.hideLoading();
      DialogHelper.showErroDialog(
          title: "Password", description: "Password Not Match");
    } else {
      createAccount(email, password).then((res) {
        DialogHelper.hideLoading();
        isDataLoading.value = false;
        if (res == null) {
          Get.to(() => HomeScreen());
        } else {
          DialogHelper.hideLoading();
          DialogHelper.showErroDialog(
              title: "SignUp Failed !!", description: res);

          isDataLoading.value = false;
        }
      });
    }
  }

  Future<String?> createAccount(String email, String password) async {
    isDataLoading.value = true;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
