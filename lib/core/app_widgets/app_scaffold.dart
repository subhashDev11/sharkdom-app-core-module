import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_core_module/core/app_styles.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(
      {super.key,
      required this.title,
      required this.body,
      this.bottomSheet,
      this.resizeToAvoidBottomInset,
      this.showLeading,
      this.leadingTap,
      this.bgColor,
      this.elevation,
      this.fab,
      this.appBar,
      this.actions});

  final String title;
  final Widget body;
  final Widget? bottomSheet;
  final bool? resizeToAvoidBottomInset;
  final bool? showLeading;
  final VoidCallback? leadingTap;
  final Color? bgColor;
  final double? elevation;
  final FloatingActionButton? fab;
  final AppBar? appBar;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      bottomSheet: bottomSheet,
      backgroundColor: bgColor ?? Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: (showLeading ?? false)
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        title: Text(title,style: GilroyFonts.gilroyMediumStyle(
          color: Colors.black,
          fontSize: 15.sp,
        ),),
        centerTitle: false,
      ),
      body: body,
      floatingActionButton: fab,
    );
  }
}
