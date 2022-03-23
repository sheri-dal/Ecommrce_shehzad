import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shehzad_ecoomrce/Controller/BaseController.dart';
import 'package:shehzad_ecoomrce/Helper/Components/dialog_helper.dart';
import 'package:shehzad_ecoomrce/View/WebAdminPages/WebDashboard.dart';

class WebLoginController extends BaseController {
  TextEditingController userController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  var isloading = false.obs;

  void login(String Username, String Password) {
    adminSignIn(Username).then((value) async {
      if (value["Username"] == Username && value["Password"] == Password) {
        try {
          var user = await FirebaseAuth.instance.signInAnonymously();

          if (user != null) {
            Get.to(() => WebDashbord());
          }
        } on FirebaseAuthException catch (ex) {
          isloading.value = false;
          DialogHelper.showErroDialog(
              title: "Login Failed !!", description: ex.message);
        }
      }
    });
  }

  Future<dynamic> adminSignIn(id) async {
    var result =
        await FirebaseFirestore.instance.collection("Admin").doc(id).get();

    return result;
  }
}
