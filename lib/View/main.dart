import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shehzad_ecoomrce/Helper/Responsive_Work/Responsive.dart';
import 'package:shehzad_ecoomrce/View/LogInScreen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        home: LoginScreen(),
      );
    });
  }
}
