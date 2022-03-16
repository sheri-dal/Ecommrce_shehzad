import 'package:flutter/material.dart';

import 'package:shehzad_ecoomrce/Helper/Components/PrimaryText.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final Color btnColor;
  final Color btntrxtcolor;
  final GestureTapCallback onPressed;
  const MyButton(
      {Key? key,
      required this.buttonName,
      this.btnColor = Colors.black,
      this.btntrxtcolor = Colors.white,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.amber)),
        child: Center(
            child: PrimaryText(
          text: buttonName,
          color: btntrxtcolor,
          size: 16,
        )),
      ),
    );
  }
}
