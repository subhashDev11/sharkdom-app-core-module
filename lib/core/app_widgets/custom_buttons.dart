import 'package:app_core_module/core/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_core_module/core/color_constant.dart';

enum CustomButtonStyle {
  primary,
  outline,
}

class CustomButtonWidget extends StatelessWidget {
  final CustomButtonStyle style;
  final Function onPressed;
  final String text;
  final Widget? content;
  final Widget? iconWidget;
  final bool enabled;
  final EdgeInsets? padding;
  final bool? iconAlignRight;
  final double? height;
  final double? width;

  const CustomButtonWidget({
    super.key,
    this.style = CustomButtonStyle.primary,
    required this.onPressed,
    required this.text,
    this.content,
    this.enabled = true,
    this.padding,
    this.iconWidget,
    this.iconAlignRight,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final outlineButtonTextStyle = GoogleFonts.roboto(
      color: enabled
          ? ColorConstant.primaryColor
          : ColorConstant.primaryColor.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
    );

    final primaryButtonTextStyle = GoogleFonts.roboto(
      color: enabled ? Colors.white : Colors.white.withOpacity(0.7),
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
    );

    Widget centerContent(CustomButtonStyle buttonStyle) => iconWidget != null
        ? ((iconAlignRight ?? false)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: buttonStyle == CustomButtonStyle.outline
                        ? outlineButtonTextStyle
                        : primaryButtonTextStyle,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  iconWidget!,
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconWidget!,
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    text,
                    style: buttonStyle == CustomButtonStyle.outline
                        ? outlineButtonTextStyle
                        : primaryButtonTextStyle,
                  ),
                ],
              ))
        : Text(
            text,
            style: buttonStyle == CustomButtonStyle.outline
                ? outlineButtonTextStyle
                : primaryButtonTextStyle,
          );

    switch (style) {
      case CustomButtonStyle.primary:
        return InkWell(
          onTap: enabled
              ? () {
                  onPressed();
                }
              : null,
          child: Container(
            padding: padding ??
                const EdgeInsets.only(
                  top: 10,
                  left: 24,
                  right: 16,
                  bottom: 10,
                ),
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: !enabled
                  ? ColorConstant.primaryColor.withOpacity(0.5)
                  : ColorConstant.primaryColor,
            ),
            child: Center(
              child: centerContent(style),
            ),
          ),
        );
      case CustomButtonStyle.outline:
        return InkWell(
          onTap: enabled
              ? () {
                  onPressed();
                }
              : null,
          child: Container(
            padding: padding ??
                const EdgeInsets.only(
                  top: 10,
                  left: 24,
                  right: 16,
                  bottom: 10,
                ),
            decoration: ShapeDecoration(
              color: context.getBrightnessBG,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  color: ColorConstant.primaryColor,
                ),
                borderRadius: BorderRadius.circular(58),
              ),
            ),
            child: Center(
              child: centerContent(style),
            ),
          ),
        );
    }
  }
}
