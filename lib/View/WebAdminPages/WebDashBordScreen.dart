import 'package:flutter/widgets.dart';
import 'package:shehzad_ecoomrce/Helper/Components/PrimaryText.dart';

class WebDashBoardScreen extends StatelessWidget {
  static const String id = "webDashBoardProdect";
  const WebDashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PrimaryText(text: "WebDashBoardProdect"),
    );
  }
}
