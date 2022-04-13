import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shehzad_ecoomrce/Controller/BaseController.dart';
import 'package:shehzad_ecoomrce/Helper/Components/dialog_helper.dart';
import 'package:shehzad_ecoomrce/View/WebAdminPages/WebMainScreen.dart';

class WebLoginController extends BaseController {
  TextEditingController userController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  var isloading = false.obs;

  Future<void> login(String Username, String Password) async {
    isloading.value = true;
    await adminSignIn(Username).then((value) async {
      if (value != "_JsonDocumentSnapshot") {
        DialogHelper.showErroDialog(
            title: "Login Failed !!", description: "LoginFalied");
        isloading.value = false;
      }
      if (value["Username"] == Username && value["Password"] == Password) {
        DialogHelper.hideLoading();
        try {
          UserCredential user = await FirebaseAuth.instance.signInAnonymously();

          // ignore: unnecessary_null_comparison
          if (user != null) {
            print("test");
            Get.to(() => WebMainScreen());
            isloading.value = false;
            //  Get.toNamed(WebDashbord.id);
          }
        } catch (e) {
          DialogHelper.showErroDialog(
              title: "Login Failed !!", description: e.toString());
          isloading.value = false;
        }
      }
    });
  }

  Future<DocumentSnapshot> adminSignIn(id) async {
    var result = FirebaseFirestore.instance.collection("Admin").doc(id).get();

    return result;
  }
}
