import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? labelText;
  final bool obscuretext;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final int maxLines;
  const MyTextField(
      {Key? key,
      this.labelText,
      this.obscuretext = false,
      this.controller,
      this.suffixIcon,
      this.focusNode,
      this.textInputType,
      this.textInputAction,
      this.maxLines = 1,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.5),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        validator: validator,
        obscureText: obscuretext,
        focusNode: focusNode,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(10),
            labelText: labelText),
      ),
    );
  }
}
