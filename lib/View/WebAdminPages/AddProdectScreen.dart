// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shehzad_ecoomrce/Helper/Components/PrimaryText.dart';
import 'package:shehzad_ecoomrce/Helper/Responsive_Work/sizeConfig.dart';
import 'package:shehzad_ecoomrce/Helper/Widgets/MyButton.dart';
import 'package:shehzad_ecoomrce/View/HomeScreen.dart';
import '../../Controller/WebAdminController/WebAddProductController.dart';
import '../HomeScreen.dart';

class WebAddProductScreen extends StatelessWidget {
  static const id = "/WebAddProductScreen";
  String? selectedvalue;

  AddProductController addProductController = Get.put(AddProductController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PrimaryText(text: "Add Product"),
              DropdownButtonFormField(
                validator: (value) {
                  if (value == null) {
                    return "Categoty Must Be Selectd";
                  }
                  return null;
                },
                value: selectedvalue ?? "GROCERY",
                items: categories
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: PrimaryText(
                            text: e,
                            size: 7,
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  selectedvalue = value.toString();
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyButton(
                buttonName: "PICK IMAGES",
                btnColor: Colors.white,
                btntrxtcolor: Colors.black,
                btnBordercolor: Colors.black,
                onPressed: () {
                  addProductController.pickImage();
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyButton(
                buttonName: "UPLOAD IMAGES",
                btnColor: Colors.white,
                btntrxtcolor: Colors.black,
                btnBordercolor: Colors.black,
                onPressed: () {
                  addProductController
                      .postImages(addProductController.images[0]);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 35.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Obx(() => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: addProductController.images.length,
                    itemBuilder: (BuildContext contex, int index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: Image.network(
                                File(addProductController.images[index].path)
                                    .path,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  addProductController.images.removeAt(index);
                                },
                                icon: Icon(Icons.cancel))
                          ],
                        ),
                      );
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
