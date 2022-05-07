import 'package:cloud_firestore/cloud_firestore.dart';
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
  var issaving = false.obs;
  var isUploading = false.obs;

  pickImage() async {
    final List<XFile>? pickImage = await imagePicker.pickMultiImage();

    if (pickImage != null) {
      images.addAll(pickImage);
    } else {
      DialogHelper.showLoading("No Images");
    }
  }

  Future postImages(XFile? imagefile) async {
    isUploading.value = true;
    String urls;
    Reference ref =
        FirebaseStorage.instance.ref().child("images").child(imagefile!.path);

    if (kIsWeb) {
      await ref.putData(
        await imagefile.readAsBytes(),
        SettableMetadata(contentType: "images/jpeg"),
      );
      urls = await ref.getDownloadURL();
      isUploading.value = false;
      return urls;
    }
  }

  UploadImages() async {
    for (var image in images) {
      await postImages(image).then((imgUrl) => imgurl.add(imgUrl));
    }
  }

  save() async {
    issaving.value = true;
    await UploadImages();
    await FirebaseFirestore.instance
        .collection("products")
        .add({"images": imgurl}).whenComplete(
      () => {issaving.value = false, imgurl.clear(), images.clear()},
    );
  }
}
