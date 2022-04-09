// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import 'package:shehzad_ecoomrce/Helper/Components/PrimaryText.dart';
import 'package:shehzad_ecoomrce/View/WebAdminPages/AddCartScreen.dart';
import 'package:shehzad_ecoomrce/View/WebAdminPages/DeleteProductScreen.dart';
import 'package:shehzad_ecoomrce/View/WebAdminPages/UpdateProductScreen.dart';
import 'package:shehzad_ecoomrce/View/WebAdminPages/WebDashBordScreen.dart';
import 'package:shehzad_ecoomrce/View/WebAdminPages/addProdectScreen.dart';

class WebMainScreen extends StatefulWidget {
  static const id = "/WebMainScreen";

  @override
  State<WebMainScreen> createState() => _WebMainScreenState();
}

class _WebMainScreenState extends State<WebMainScreen> {
  Widget selectedSCreen = WebDashBoardScreen();

  chooseScreens(item) {
    switch (item) {
      case WebDashBoardScreen.id:
        setState(() {
          selectedSCreen = WebDashBoardScreen();
        });
        break;
      case WebUpdateProdect.id:
        setState(() {
          selectedSCreen = WebUpdateProdect();
        });
        break;
      case WebAddProductScreen.id:
        setState(() {
          selectedSCreen = WebAddProductScreen();
        });
        break;
      case WebDeleteProdect.id:
        setState(() {
          selectedSCreen = WebDeleteProdect();
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        title: PrimaryText(
          text: "Admin",
          size: 14,
        ),
      ),
      sideBar: SideBar(
          onSelected: (item) {
            chooseScreens(item.route);
          },
          items: [
            MenuItem(
                title: "DashBoard",
                icon: Icons.dashboard,
                route: WebDashBoardScreen.id),
            MenuItem(
                title: "Add Products",
                icon: Icons.add,
                route: WebAddProductScreen.id),
            MenuItem(
                title: "Update Products",
                icon: Icons.update,
                route: WebUpdateProdect.id),
            MenuItem(
                title: "Delete Products",
                icon: Icons.delete,
                route: WebDeleteProdect.id),
            MenuItem(
              title: "Cart Item",
              icon: Icons.shop,
              route: WebAddCartScreen.id,
            )
          ],
          selectedRoute: WebMainScreen.id),
      body: selectedSCreen,
    );
  }
}
