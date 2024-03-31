import 'dart:io';
import 'package:app_core_module/core/modal/organization_model/organization_model.dart';
import 'package:flutter/material.dart';
import 'package:app_core_module/core/app_widgets/image_component.dart';
import 'package:app_core_module/core/app_widgets/photo_view_screen.dart';
import 'package:app_core_module/core/image_constants.dart';
import 'package:app_core_module/core/services/navigator_service.dart';
import 'package:app_core_module/core/services/s3_file_uploader_service.dart';

import '../getit_locator.dart';

class AwsImageWidget extends StatelessWidget {
  const AwsImageWidget({
    super.key,
    this.organizationModel,
    this.id,
    this.height,
    this.width,
    this.fit,
    this.circle,
    this.radius,
    this.onTap,
  });

  final OrganizationModel? organizationModel;
  final String? id;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final bool? circle;
  final double? radius;
  final VoidCallback? onTap;

  Future<String?>? getBySource() {
    if (organizationModel != null) {
      return getIt<MinioUploadService>().getOrgLogoByOrgModel(
        organizationModel!,
      );
    } else if (id != null) {
      return getIt<MinioUploadService>().getFileById(id: id!);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getBySource(),
      builder: (_, data) {
        if (data.hasData && (data.data is String)) {
          if (circle ?? false) {
            InkWell(
              onTap: onTap,
              child: CircleAvatar(
                radius: radius ?? 65,
                backgroundImage: FileImage(File(data.data!)),
              ),
            );
          }
          return InkWell(
            onTap: onTap,
            child: ImageComponent(
              imageUrl: data.data,
              height: height,
              width: width,
              fit: fit,
            ),
          );
        } else {
          return const ImagePlaceholder();
        }
      },
    );
  }
}

class AWSCircleImage extends StatelessWidget {
  const AWSCircleImage({
    super.key,
    this.imageId,
    this.radius,
    this.organizationModel,
    this.placeholderText,
    this.onTap,
  });

  final String? imageId;
  final OrganizationModel? organizationModel;
  final double? radius;
  final String? placeholderText;
  final VoidCallback? onTap;

  Future<String?>? getBySource() {
    if (organizationModel != null) {
      return getIt<MinioUploadService>().getOrgLogoByOrgModel(
        organizationModel!,
      );
    } else if (imageId != null) {
      return getIt<MinioUploadService>().getFileById(id: imageId!);
    } else {
      return null;
    }
  }

  String? getOrgFirstLater() {
    if (organizationModel != null &&
        organizationModel!.name != null &&
        organizationModel!.name!.isNotEmpty) {
      return organizationModel!.name!.substring(0, 1).toString();
    } else if (imageId != null && imageId!.isNotEmpty) {
      return imageId!.substring(0, 1);
    } else {
      return placeholderText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getBySource(),
      builder: (_, data) {
        if (data.hasData && (data.data is String)) {
          return InkWell(
            onTap: onTap ??
                () {
                  Navigator.push(
                    context,
                    getIt<NavigatorService>().getMaterialPageRoute(
                      PhotoViewScreen(
                        imageSRC: File(data.data!).path,
                        isFileSource: true,
                      ),
                    ),
                  );
                },
            child: CircleAvatar(
              radius: radius,
              backgroundImage: FileImage(File(data.data!)),
            ),
          );
        } else if (data.data == null || data.hasError) {
          return CircleAvatar(
            radius: radius,
            backgroundImage: const AssetImage(ImageConstants.lockedOrg),
          );
          // return Container(
          //   height: radius != null ? (radius! + radius!) : null,
          //   width: radius != null ? (radius! + radius!) : null,
          //   decoration: const BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: ColorConstant.primaryColor,
          //   ),
          //   child: getOrgFirstLater() != null
          //       ? Center(
          //           child: Text(
          //             getOrgFirstLater() ?? "",
          //             style: GilroyFonts.gilroyExtraBoldStyle()?.copyWith(
          //               color: context.getBrightnessBG,
          //               fontSize: 30.sp,
          //             ),
          //           ),
          //         )
          //       : const SizedBox(),
          // );
        } else {
          return Container(
            height: radius != null ? (radius! + radius!) : null,
            width: radius != null ? (radius! + radius!) : null,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blueGrey.shade100,
                  Colors.blue.shade100,
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
