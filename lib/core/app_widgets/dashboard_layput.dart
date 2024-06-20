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
          if (showAppLogo ?? true)
            Positioned(
              bottom: context.screenSize.height * 0.22,
              right: 8,
              child: IgnorePointer(
                ignoring: true,
                child: SizedBox(
                  height: context.screenSize.height * 0.8,
                  width: context.screenSize.width * 0.75,
                  child: Image.asset(
                    ImageConstants.bgLogo,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
