import 'package:flutter/material.dart';

import 'package:shehzad_ecoomrce/Helper/Components/PrimaryText.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final Color btnColor;
  final Color btntrxtcolor;
  final Color btnBordercolor;
  final bool isLoading;
  final GestureTapCallback onPressed;
  const MyButton(
      {Key? key,
      required this.buttonName,
      this.isLoading = false,
      this.btnColor = Colors.black,
      this.btntrxtcolor = Colors.white,
      this.btnBordercolor = Colors.white,
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
            border: Border.all(color: btnBordercolor)),
        child: Stack(
          children: [
            Visibility(
              visible: isLoading ? false : true,
              child: Center(
                  child: PrimaryText(
                text: buttonName,
                color: btntrxtcolor,
                size: 16,
              )),
            ),
            Visibility(
              visible: isLoading,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
