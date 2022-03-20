// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shehzad_ecoomrce/Controller/HomeController.dart';
import 'package:shehzad_ecoomrce/Controller/LoginController.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shehzad_ecoomrce/Helper/Components/PrimaryText.dart';

class HomeScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                LoginController.signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              PrimaryText(text: "HomeScreen"),
              CarouselSlider(
                items: homeController.images
                    .map((lstiamge) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              lstiamge,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(height: 200, autoPlay: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
