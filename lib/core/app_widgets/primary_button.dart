import 'package:app_core_module/core/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, this.onTap, required this.title, this.padding, this.disable});

  final VoidCallback? onTap;
  final String title;
  final EdgeInsets? padding;
  final bool? disable;

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: (padding ??
          const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          )),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: ColorConstant.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.10,
        ),
      ),
    );
    return InkWell(
      onTap: (disable ?? false) ? null : onTap,
      child: Opacity(opacity: (disable ?? false) ? 0.5 : 0.99, child: content),
    );
  }
}
