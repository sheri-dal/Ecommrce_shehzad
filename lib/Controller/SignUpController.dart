import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shehzad_ecoomrce/Controller/BaseController.dart';
import 'package:shehzad_ecoomrce/Helper/Components/dialog_helper.dart';
import 'package:shehzad_ecoomrce/View/Dashbord.dart';

class SignUpController extends BaseController {
  var ispassword = true.obs;
  var reIspassword = true.obs;

  void log(String email, String password, String retypePassword) {
    if (password != retypePassword) {
      DialogHelper.showErroDialog(
          title: "Password", description: "Password Not Match");
    } else {
      createAccount(email, password);
    }
  }

  Future<String?> createAccount(String email, String password) async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => (res) {
                if (res != null) {
                  Get.to(() => DashbordPage());
                } else {
                  DialogHelper.showErroDialog(
                      title: "Exception", description: res);
                }
              });
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
