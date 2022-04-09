import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shehzad_ecoomrce/Controller/BaseController.dart';

class AddProductController extends BaseController {
  final imagePicker = ImagePicker();
  var images = [].obs;
  pickImage() async {
    final List<XFile>? pickImage = await imagePicker.pickMultiImage();

    if (pickImage != null) {
      images.addAll(pickImage);
    } else {
      print("No Images");
    }
  }

  Future postImages(XFile? imagefile) async {
    String url;
    Reference ref =
        FirebaseStorage.instance.ref().child("images").child(imagefile!.path);

    if (kIsWeb) {
      await ref.putData(
        await imagefile.readAsBytes(),
        SettableMetadata(contentType: "images/jpeg"),
      );
      await ref.getDownloadURL();
    }
  }
}
