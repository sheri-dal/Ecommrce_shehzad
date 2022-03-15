import 'package:flutter/material.dart';

import 'package:shehzad_ecoomrce/Helper/Components/PrimaryText.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  const MyButton({
    Key? key,
    required this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: PrimaryText(text: buttonName)),
    );
  }
}
