import 'package:flutter/material.dart';
import 'package:app_core_module/core/app_extension.dart';
import 'package:app_core_module/core/color_constant.dart';
import 'package:app_core_module/core/image_constants.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout(
      {super.key, required this.child, this.showAppLogo, this.bottomSheet});

  final Widget child;
  final bool? showAppLogo;
  final Widget? bottomSheet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryColor.withOpacity(0.9),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            top: 50,
            child: child,
          ),
        ],
      ),
    );
  }
}
