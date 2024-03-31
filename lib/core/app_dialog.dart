import 'package:app_core_module/core/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:app_core_module/core/color_constant.dart';

void showAppDialog({
  required BuildContext context,
  required Widget child,
  VoidCallback? onCloseTap,
}) {
  showDialog(
    context: context,
    builder: (_) {
      return Dialog(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  color: ColorConstant.blueDark100,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.all(20),
              child: Container(
                margin: const EdgeInsets.all(16),
                child: child,
              ),
            ),
            Positioned(
              top: -5,
              right: -5,
              child: InkWell(
                onTap: onCloseTap ??
                    () {
                      Navigator.of(context).pop();
                    },
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: const BoxDecoration(
                    color: ColorConstant.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.close,
                      color: context.getBrightnessBG,
                      size: 25,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
