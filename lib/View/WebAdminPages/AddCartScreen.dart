import 'package:flutter/widgets.dart';
import 'package:shehzad_ecoomrce/Helper/Components/PrimaryText.dart';

class WebAddCartScreen extends StatelessWidget {
  static const String id = "webaddCart";
  const WebAddCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PrimaryText(text: "WebAddCartScreen"),
    );
  }
}
