import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_core_module/core/color_constant.dart';

class PickImageUtility {
  PickImageUtility.instance({
    required this.applyEditor,
    required this.context,
    this.cropPageTitle,
    this.toolbarBackgroundColor,
    this.toolbarTextColor,
    this.initialAspectRation,
  });

  final bool applyEditor;

  final ImagePicker _picker = ImagePicker();
  final String? cropPageTitle;
  final Color? toolbarTextColor;
  final Color? toolbarBackgroundColor;
  final BuildContext context;
  final CropAspectRatioPreset? initialAspectRation;

  Future<File?> pickedFile(ImageSource imageSource) async {
    final theme = Theme.of(context);
    final pickedImage = await _picker.pickImage(
      source: imageSource,
    );
    if (pickedImage != null) {
      if (applyEditor) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedImage.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: cropPageTitle ?? 'Edit Photo',
              toolbarColor: toolbarTextColor ?? theme.scaffoldBackgroundColor,
              //toolbarWidgetColor: toolbarBackgroundColor ?? theme.primaryColor,
              initAspectRatio:
                  initialAspectRation ?? CropAspectRatioPreset.original,
              lockAspectRatio: false,
              backgroundColor: theme.scaffoldBackgroundColor,
              activeControlsWidgetColor: ColorConstant.primaryColor,
            ),
            IOSUiSettings(
              title: cropPageTitle ?? 'Edit Photo',
              showCancelConfirmationDialog: true,
            ),
          ],
        );
        if (croppedFile != null) {
          return File(croppedFile.path);
        } else {
          File(pickedImage.path);
        }
      } else {
        return File(pickedImage.path);
      }
    }
    return null;
  }
}
