import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_core_module/core/app_extension.dart';
import 'package:app_core_module/core/app_styles.dart';
import 'package:app_core_module/core/app_widgets/app_layout.dart';
import 'package:app_core_module/core/image_constants.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen(
      {super.key, required this.title, required this.subtitle, this.onTap});

  final String title;
  final String subtitle;
  final Function? onTap;

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      autoBack();
    });
    super.initState();
  }

  void autoBack() {
    if (widget.onTap == null) {
      Future.delayed(const Duration(
        seconds: 2,
      )).then((value) {
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      showAppLogo: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 40.w,
          vertical: 10.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImageConstants.success,
              width: context.screenSize.width * 0.4,
              height: context.screenSize.width * 0.4,
            ),
            SizedBox(
              height: 42.h,
            ),
            Text(
              'Congratulations',
              style: GilroyFonts.gilroyExtraBoldStyle(
                color: Colors.white,
                fontSize: 32.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.80,
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              child: Text(
                'You have successfully become a Sharkdomer now.',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
