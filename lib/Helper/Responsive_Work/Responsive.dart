import 'package:flutter/material.dart';
import 'package:shehzad_ecoomrce/Helper/Responsive_Work/sizeConfig.dart';

typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
  DeviceType deviceType,
);

class MyResponsive extends StatelessWidget {
  const MyResponsive({Key? key, required this.builder}) : super(key: key);

  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizerUtil.setScreenSize(constraints, orientation);
        return builder(context, orientation, SizerUtil.deviceType);
      });
    });
  }
}
