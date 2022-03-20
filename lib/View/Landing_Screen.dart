// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shehzad_ecoomrce/Helper/Components/PrimaryText.dart';
import 'package:shehzad_ecoomrce/View/HomeScreen.dart';
import 'package:shehzad_ecoomrce/View/LogInScreen.dart';

class LandingScreen extends StatelessWidget {
  Future<FirebaseApp> initiliza = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initiliza,
        builder: (BuildContext contex, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: PrimaryText(text: "${snapshot.error}"),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (BuildContext contex, AsyncSnapshot streamsnapshot) {
                  if (streamsnapshot.hasError) {
                    return Scaffold(
                      body: PrimaryText(text: "${snapshot.error}"),
                    );
                  }
                  if (streamsnapshot.connectionState ==
                      ConnectionState.active) {
                    User? user = streamsnapshot.data;
                    if (user == null) {
                      return LoginScreen();
                    } else {
                      return HomeScreen();
                    }
                  }
                  return Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: PrimaryText(text: "Check"),
                        ),
                        CircularProgressIndicator()
                      ],
                    ),
                  );
                });
          }
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: PrimaryText(text: "Loading"),
                ),
                CircularProgressIndicator()
              ],
            ),
          );
        });
  }
}
