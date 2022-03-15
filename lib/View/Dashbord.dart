import 'package:flutter/material.dart';
import 'package:shehzad_ecoomrce/Helper/Responsive_Work/sizeConfig.dart';

class DashbordPage extends StatelessWidget {
  const DashbordPage({Key? key}) : super(key: key);

  // int _currentIndex = 0;
  // var _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 20.h,
        height: 20.w,
        color: Colors.amber,
      ),
      // bottomNavigationBar: MyBottomNavyBar(
      //     selectedIndex: _currentIndex,
      //     showElevation: true, // use this to remove appBar's elevation
      //     onItemSelected: (index) => setState(() {
      //           _currentIndex = index;
      //           _pageController.animateToPage(index,
      //               duration: Duration(milliseconds: 300), curve: Curves.ease);
      //         }),
      //     items: []),
    );
  }
}
