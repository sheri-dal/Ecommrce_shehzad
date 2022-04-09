import 'package:shehzad_ecoomrce/View/WebAdminPages/AddCartScreen.dart';
import 'package:shehzad_ecoomrce/View/WebAdminPages/AddProdectScreen.dart';
import 'package:shehzad_ecoomrce/View/WebAdminPages/DeleteProductScreen.dart';
import 'package:shehzad_ecoomrce/View/WebAdminPages/UpdateProductScreen.dart';
import 'package:shehzad_ecoomrce/View/WebAdminPages/WebDashBordScreen.dart';
import 'package:shehzad_ecoomrce/View/WebAdminPages/WebMainScreen.dart';
import 'package:shehzad_ecoomrce/View/WebAdminPages/webLogin.dart';

class MyRoute {
  static var routes = {
    //Web Screens
    WebloginScreen.id: (context) => WebloginScreen(),
    WebMainScreen.id: (context) => WebMainScreen(),
    WebDeleteProdect.id: (context) => WebDeleteProdect(),
    WebAddCartScreen.id: (context) => WebAddCartScreen(),
    WebAddProductScreen.id: (context) => WebAddProductScreen(),
    WebUpdateProdect.id: (context) => WebUpdateProdect(),
    WebDashBoardScreen.id: (context) => WebDashBoardScreen(),
    //End Web Svreens
  };
}
