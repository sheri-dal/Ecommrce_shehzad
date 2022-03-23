import 'package:flutter/material.dart';

class WebDashbord extends StatelessWidget {
  const WebDashbord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Container(
            color: Colors.amber,
          )),
          Expanded(
              child: Container(
            color: Colors.black,
          ))
        ],
      ),
    );
  }
}
