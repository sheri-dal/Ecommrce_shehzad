import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? labelText;
  const MyTextField({
    Key? key,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.5),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(10),
            labelText: labelText),
      ),
    );
  }
}
