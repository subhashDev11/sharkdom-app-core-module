import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_core_module/core/app_extension.dart';
import '../color_constant.dart';

class ScreenCard extends StatelessWidget {
  const ScreenCard({super.key, required this.child, this.showIndicator,
    this.elevation=0,});

  final bool? showIndicator;
  final Widget child;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (primaryFocus?.hasFocus ?? false) {
          primaryFocus?.unfocus();
        }
      },
      child: Card(
        elevation: elevation,
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            )),
        color: Theme.of(context).brightness == Brightness.light ? Colors.white : null,
        child: (showIndicator ?? true)
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 7.h,
                width: context.screenSize.width * 0.3,
                decoration: ShapeDecoration(
                  color: ColorConstant.divideColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24242),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            child,
          ],
        )
            : child,
      ),
    );
  }
}
