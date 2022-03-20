import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shehzad_ecoomrce/Controller/BaseController.dart';
import 'package:shehzad_ecoomrce/Helper/Components/dialog_helper.dart';
import 'package:shehzad_ecoomrce/View/Dashbord.dart';

class SignUpController extends BaseController {
  var ispassword = true.obs;
  var reIspassword = true.obs;
  var isDataLoading = false.obs;

  void log(String email, String password, String retypePassword) {
    DialogHelper.showLoading("Loading");
    if (password != retypePassword) {
      DialogHelper.hideLoading();
      DialogHelper.showErroDialog(
          title: "Password", description: "Password Not Match");
    } else {
      createAccount(email, password).then((res) {
        print("Test");
        if (res == null) {
          Get.to(() => DashbordPage());
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
