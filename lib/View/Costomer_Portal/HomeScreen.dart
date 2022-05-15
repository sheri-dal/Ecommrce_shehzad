// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:shehzad_ecoomrce/Helper/Components/PrimaryText.dart';
import 'package:shehzad_ecoomrce/Helper/Widgets/HomeCrads.dart';

import '../../Controller/CustomerPortal/HomeController.dart';
import '../../Controller/CustomerPortal/LoginController.dart';

List categories = [
  "GROCERY",
  "PHARMACY",
  "COSMETICS",
  "ELECTRONICS",
];

class HomeScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                loginController.signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                PrimaryText(text: "HomeScreen"),
                CarouselSlider(
                  items: homeController.images
                      .map((lstiamge) => Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    lstiamge,
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                    height: 200,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blueAccent.withOpacity(0.3),
                                        Colors.red.withOpacity(0.3),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 20,
                                child: Container(
                                  color: Colors.black.withOpacity(.5),
                                  child: PrimaryText(
                                    text: "Title",
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ))
                      .toList(),
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                  ),
                ),
                HomeCard(title: categories[0]),
                HomeCard(title: categories[1]),
                HomeCard(title: categories[2]),
                HomeCard(title: categories[3]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
