import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shehzad_ecoomrce/Helper/Responsive_Work/Responsive.dart';
import 'package:get/get.dart';
import 'package:shehzad_ecoomrce/Helper/Rotes.dart';
import 'package:shehzad_ecoomrce/View/WebAdminPages/WebMainScreen.dart';

import 'View/layout_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBMuwNHLy-1MLfvMluRfqCseZFGcEbsAQU",
            authDomain: "shehzadecoomrce.firebaseapp.com",
            projectId: "shehzadecoomrce",
            storageBucket: "shehzadecoomrce.appspot.com",
            messagingSenderId: "462647132562",
            appId: "1:462647132562:web:1d76fae0f40ef6d66ac14b"));
  } else {
    await Firebase.initializeApp();
  }

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyResponsive(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zibyan Store',
        theme: ThemeData(
            primarySwatch: Colors.blue, backgroundColor: Colors.white),
        home: LayoutScreen(),
        //home: WebMainScreen(),
        routes: MyRoute.routes,
        //  getPages: MyRoute.routes,
      );
    });
  }
}
//134456487
//12313121212312313222322112