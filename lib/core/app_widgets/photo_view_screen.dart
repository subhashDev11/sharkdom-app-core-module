import 'dart:io';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstant.primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
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
