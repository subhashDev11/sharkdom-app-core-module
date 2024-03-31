import 'dart:io';
import 'package:app_core_module/core/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:app_core_module/core/color_constant.dart';

class PhotoViewScreen extends StatelessWidget {
  const PhotoViewScreen(
      {super.key, required this.imageSRC, required this.isFileSource});

  final String imageSRC;
  final bool isFileSource;

  @override
  Widget build(BuildContext context) {
    ImageProvider? imageProvider;
    if (isFileSource) {
      imageProvider = FileImage(File(imageSRC));
    } else {
      imageProvider = NetworkImage(imageSRC);
    }
    return Scaffold(
      backgroundColor: context.getBrightnessBG,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstant.primaryColor,
        leading: IconButton(
          icon:  Icon(
            Icons.arrow_back_ios_new_outlined,
            color: context.getBrightnessBG,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: PhotoView(
        imageProvider: imageProvider,
        enableRotation: true,
      ),
    );
  }
}
