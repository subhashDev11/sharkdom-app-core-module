import 'package:flutter/material.dart';

class UnderlineText extends StatelessWidget {
  const UnderlineText({
    super.key,
    required this.text,
    this.underlineThickness,
    this.onTap,
  });

  final Text text;
  final double? underlineThickness;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          // Text
          text,
          // Underline
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: underlineThickness ?? 1.0,
              color: text.style?.color ??
                  Colors.black, // Use text color or default to black
            ),
          ),
        ],
      ),
    );
  }
}
