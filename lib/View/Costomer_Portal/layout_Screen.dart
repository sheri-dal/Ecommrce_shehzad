import 'package:flutter/material.dart';
import 'package:shehzad_ecoomrce/View/WebAdminPages/webLogin.dart';

import 'Landing_Screen.dart';

class LayoutScreen extends StatelessWidget {
  static const id = "Layout";
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.minWidth > 600) {
          return WebloginScreen();
        } else {
          return LandingScreen();
        }
      },
    );
  }
}
