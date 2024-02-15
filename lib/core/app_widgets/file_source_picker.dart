import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_core_module/core/image_constants.dart';

class FileSourcePickerWidget extends StatelessWidget {
  const FileSourcePickerWidget({super.key, this.onSourceTap});

  final Function(ImageSource source)? onSourceTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PickerSourceItem(
              title: "Open Camera",
              sourceIcon: ImageConstants.camera,
              onTap: () {
                Navigator.of(context).pop(ImageSource.camera);
              },
            ),
            PickerSourceItem(
              title: "Choose from \ngallery",
              sourceIcon: ImageConstants.folder,
              onTap: () {
                Navigator.of(context).pop(ImageSource.gallery);
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class PickerSourceItem extends StatelessWidget {
  const PickerSourceItem(
      {super.key, this.onTap, required this.title, required this.sourceIcon});

  final VoidCallback? onTap;
  final String title;
  final String sourceIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: OvalBorder(side: BorderSide(width: 2)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                sourceIcon,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.10,
            ),
          ),
        ],
      ),
    );
  }
}
