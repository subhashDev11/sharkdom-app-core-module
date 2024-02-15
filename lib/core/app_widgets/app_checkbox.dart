import 'package:flutter/material.dart';
import 'package:app_core_module/core/color_constant.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({super.key, required this.selected, this.selectedColor});
  final bool selected;
  final Color? selectedColor;

  Color getSelectedColor() {
    if (selectedColor != null) {
      return selectedColor!;
    } else {
      return ColorConstant.blueLight600;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: selected ? getSelectedColor() : ColorConstant.blueLight100,
            width: 2.5,
          )),
      child: selected
          ? Center(
              child: Container(
                height: 14,
                width: 14,
                decoration: BoxDecoration(
                  color: getSelectedColor(),
                  shape: BoxShape.circle,
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
