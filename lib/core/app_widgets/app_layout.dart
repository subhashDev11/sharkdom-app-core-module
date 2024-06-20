import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_core_module/core/app_extension.dart';
import 'package:app_core_module/core/color_constant.dart';
import 'package:app_core_module/core/image_constants.dart';

class AppLayout extends StatelessWidget {
  const AppLayout(
      {super.key,
      required this.child,
      this.showAppLogo,
      this.bottomSheet,
      this.layoutColor});

  final Widget child;
  final bool? showAppLogo;
  final Widget? bottomSheet;
  final Color? layoutColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          layoutColor ?? ColorConstant.primaryColor.withOpacity(0.9),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            top: 50.h,
            child: child,
          ),
          if (showAppLogo ?? true)
            Positioned(
              bottom: context.screenSize.height * 0.22.h,
              right: 8.w,
              child: IgnorePointer(
                ignoring: true,
                child: SizedBox(
                  height: context.screenSize.height * 0.8.h,
                  width: context.screenSize.width * 0.75.w,
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
