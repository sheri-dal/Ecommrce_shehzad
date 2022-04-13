import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final Color? backgroundColor;
  final Color? color;
  const Loader({
    Key? key,
    this.backgroundColor = Colors.white,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color?.withOpacity(0.5),
      backgroundColor: backgroundColor,
    );
  }
}
