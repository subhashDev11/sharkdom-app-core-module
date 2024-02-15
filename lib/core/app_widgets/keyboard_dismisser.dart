import 'package:flutter/material.dart';

class KeyboardDismissWidget extends StatelessWidget {
  const KeyboardDismissWidget({super.key, required this.child, this.onDismiss});

  final Widget child;
  final Function? onDismiss;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (primaryFocus?.hasFocus ?? false) {
          primaryFocus?.unfocus();
          if (onDismiss != null) {
            onDismiss!();
          }
        }
      },
      child: child,
    );
  }
}
