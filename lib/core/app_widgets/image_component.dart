import 'dart:io';
import 'package:app_core_module/core/app_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:app_core_module/core/image_constants.dart';

import 'photo_view_screen.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent({
    super.key,
    this.imageUrl = '',
    this.width = double.maxFinite,
    this.fit = BoxFit.fitWidth,
    this.useEmptyImagePlaceholder = false,
    this.height = 200,
    this.squareWidth = false,
    this.isTrackCompletedImage = false,
    this.radius = 0,
    this.alignment = Alignment.center,
    this.viewPhoto = true,
  });

  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final bool squareWidth;
  final bool isTrackCompletedImage;
  final Alignment alignment;
  final double radius;
  final bool useEmptyImagePlaceholder;
  final bool viewPhoto;

  bool isFilePath(String? input) {
    if (input == null || input.isEmpty) {
      return false;
    }
    try {
      final uri = Uri.parse(input);
      if (uri.scheme == 'file' || uri.scheme == '' && uri.host.isEmpty) {
        // It's a file path or a relative file path.
        return true;
      } else if (uri.isAbsolute &&
          (uri.scheme == 'http' || uri.scheme == 'https')) {
        // It's a network URL.
        return false;
      }
    } catch (e) {
      // Invalid URI, not a file path or network URL.
    }
    return false;
  }

  Widget _image(BuildContext context) {
    if (imageUrl != null && isFilePath(imageUrl ?? "")) {
      return GestureDetector(
        onTap: !viewPhoto
            ? null
            : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PhotoViewScreen(
                      imageSRC: imageUrl!,
                      isFileSource: true,
                    ),
                  ),
                );
              },
        child: SizedBox(
          width: width,
          height: height,
          child: Image.file(
            File(imageUrl!),
            fit: fit,
          ),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: GestureDetector(
          onTap: !viewPhoto
              ? null
              : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PhotoViewScreen(
                        imageSRC: imageUrl!,
                        isFileSource: false,
                      ),
                    ),
                  );
                },
          child: CachedNetworkImage(
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: fit,
                  alignment: alignment,
                ),
              ),
              child: isTrackCompletedImage
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, right: 8),
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration:  BoxDecoration(
                              color: context.getBrightnessBG, shape: BoxShape.circle),
                          child: const Center(
                            child: Icon(Icons.done,
                                color: Colors.orange, size: 12),
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
            imageUrl: imageUrl ?? "",
            errorWidget: (context, _, __) => ImagePlaceholder(
              width: width,
              height: height,
              useEmptyImagePlaceholder: useEmptyImagePlaceholder,
            ),
            placeholder: (context, _) => ImagePlaceholder(
              width: width,
              height: height,
              useEmptyImagePlaceholder: useEmptyImagePlaceholder,
            ),
            fit: fit,
            width: width,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return squareWidth
        ? SizedBox(
            width: width,
            child: AspectRatio(
              aspectRatio: 1,
              child: _image(context),
            ),
          )
        : SizedBox(
            width: width,
            height: height,
            child: _image(context),
          );
  }
}

class ImagePlaceholder extends StatelessWidget {
  final double? height;
  final double? width;
  final bool useEmptyImagePlaceholder;

  const ImagePlaceholder(
      {super.key,
      this.height,
      this.width,
      this.useEmptyImagePlaceholder = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (useEmptyImagePlaceholder) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(ImageConstants.placeholder),
              fit: BoxFit.contain),
          color: theme.primaryColor,
        ),
      );
    }
    return DecoratedBox(
      decoration: BoxDecoration(
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
}
