import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_core_module/core/color_constant.dart';

class CustomTabView extends StatelessWidget {
  const CustomTabView({
    super.key,
    required this.title,
    required this.selected,
    this.onTap,
    required this.locked,
    this.radius,
    this.borderColor,
    this.padding,
  });

  final String title;
  final bool selected;
  final VoidCallback? onTap;
  final bool locked;
  final double? radius;
  final Color? borderColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    if (selected) {
      return InkWell(
        onTap: onTap,
        child: Container(
          //height: 32,
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
          decoration: ShapeDecoration(
            color: ColorConstant.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
            ),
          ),
          child: Text(
            title,
            style: GoogleFonts.roboto(
              color: context.getBrightnessBG,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    } else {
      if (locked) {
        return Opacity(
          opacity: 0.5,
          child: Container(
            padding: padding ??
                const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 2,
                  color: ColorConstant.primaryColor,
                ),
                borderRadius: BorderRadius.circular(radius ?? 8),
              ),
            ),
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.lock,
                  color: ColorConstant.primaryColor,
                  size: 16,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: GoogleFonts.roboto(
                    color: ColorConstant.primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return InkWell(
        onTap: onTap,
        child: Container(
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 10,
              ),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 2,
                color: borderColor ?? ColorConstant.primaryColor,
              ),
              borderRadius: BorderRadius.circular(radius ?? 8),
            ),
          ),
          child: Text(
            title,
            style: GoogleFonts.roboto(
              color: ColorConstant.primaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    }
  }
}
