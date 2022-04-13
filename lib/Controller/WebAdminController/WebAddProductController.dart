import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shehzad_ecoomrce/Controller/BaseController.dart';

import '../../Helper/Components/dialog_helper.dart';

class AddProductController extends BaseController {
  final imagePicker = ImagePicker();
  var images = [].obs;
  List<String> imgurl = [];
  pickImage() async {
    final List<XFile>? pickImage = await imagePicker.pickMultiImage();

    if (pickImage != null) {
      images.addAll(pickImage);
    } else {
      DialogHelper.showLoading("No Images");
      print("No Images");
    }
  }

  Future postImages(XFile? imagefile) async {
    String urls;
    Reference ref =
        FirebaseStorage.instance.ref().child("images").child(imagefile!.path);

    if (kIsWeb) {
      await ref.putData(
        await imagefile.readAsBytes(),
        SettableMetadata(contentType: "images/jpeg"),
      );
      urls = await ref.getDownloadURL();
      return urls;
    }
  }

  UploadImages() async {
    for (var image in images) {
      await postImages(image).then((imgUrl) => imgurl.add(imgUrl));
    }
  }
}
