import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_core_module/core/app_styles.dart';

class EmptyDataMessageWidget extends StatelessWidget {
  const EmptyDataMessageWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: GilroyFonts.gilroyExtraBoldStyle(
          fontSize: 14.sp,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
