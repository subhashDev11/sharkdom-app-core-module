import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:app_core_module/core/app_extension.dart';
import 'package:app_core_module/core/app_styles.dart';
import 'package:app_core_module/core/color_constant.dart';
import 'custom_tab_view.dart';

class AppInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? initialText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Function(String) onChanged;
  //final Function(String)? onSubmit;
  final Function()? onEditingCompleted;
  final Function(String?)? onSaved;
  final VoidCallback? onSuffixIconTap;
  final VoidCallback? onPrefixIconTap;
  final String? Function(String?)? validator;
  final int? maxLine;
  final int? minLine;
  final int? maxLength;
  final int? minLength;
  final TextInputAction? textInputAction;
  final Color? borderColor;

  const AppInputField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.onChanged,
    this.labelText,
    this.suffixIcon,
    this.maxLine,
    this.maxLength,
    this.minLine,
    this.validator,
    this.onSuffixIconTap,
    this.onPrefixIconTap,
    this.textInputAction,
    this.borderColor,
    this.onEditingCompleted,
    this.onSaved,
    this.minLength,
    this.initialText,
   // this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (labelText != null)
            Padding(
              padding: EdgeInsets.only(
                bottom: 8.h,
              ),
              child: Text(
                labelText ?? "",
                style: GilroyFonts.gilroyMediumStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.20,
                  color: borderColor,
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(
              left: 1.w,
            ),
            child: TextFormField(
              //onFieldSubmitted: onSubmit,
              initialValue: controller==null ? initialText : null,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator,
              maxLines:
                  ((obscureText ?? false) && maxLine == null) ? 1 : maxLine,
              minLines: minLine,
              controller: controller,
              textInputAction: textInputAction,
              decoration: InputDecoration(
                errorMaxLines: 3,
                hintText: hintText,
                prefixIcon: prefixIcon != null
                    ? InkWell(
                        onTap: onPrefixIconTap,
                        child: Icon(prefixIcon,
                            color: context.getTheme.textTheme.bodySmall?.color),
                      )
                    : null,
                suffixIcon: suffixIcon != null
                    ? InkWell(
                        onTap: onSuffixIconTap,
                        child: Icon(
                          suffixIcon,
                          color: context.getTheme.textTheme.bodySmall?.color,
                        ),
                      )
                    : null,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: borderColor ?? ColorConstant.divideColor1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: borderColor ?? ColorConstant.divideColor1),
                  borderRadius: BorderRadius.circular(8),
                ),
                hintStyle: GoogleFonts.montserrat(
                  color: borderColor ?? ColorConstant.hintTxtColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.28,
                ),
              ),
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.28,
                color: borderColor,
              ),
              obscureText: obscureText ?? false,
              keyboardType: keyboardType,
              onChanged: onChanged,
              onEditingComplete: onEditingCompleted,
              onSaved: onSaved,
              maxLength: maxLength,
            ),
          ),
        ],
      ),
    );
  }
}

class DropDownInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String? value)? onChanged;
  final String? Function(String?)? validator;
  final List<String> options;
  final VoidCallback? onTap;
  final bool? readOnly;
  final String? selected;

  const DropDownInput({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.onChanged,
    this.labelText,
    this.suffixIcon,
    this.options = const ["B", "AM", "ODO", "HJD"],
    this.onTap,
    this.readOnly,
    this.validator, this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null)
          Padding(
            padding: EdgeInsets.only(
              bottom: 8.h,
            ),
            child: Text(
              labelText ?? "",
              style: GilroyFonts.gilroyMediumStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.20,
              ),
            ),
          ),
        Padding(
          padding: EdgeInsets.only(
            left: 1.w,
          ),
          child: DropdownButtonFormField(
            validator: validator,
            onTap: onTap,
            items: options
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            icon: const Icon(
              Icons.keyboard_arrow_down,
            ),
            alignment: Alignment.topLeft,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: ColorConstant.divideColor1),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: ColorConstant.divideColor1),
                borderRadius: BorderRadius.circular(8),
              ),
              hintStyle: GoogleFonts.montserrat(
                color: ColorConstant.hintTxtColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.28,
              ),
            ),
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.28,
              color: context.isDarkTheme ? Colors.white : Colors.black,
            ),
            onChanged: onChanged,
            value: selected,
          ),
        ),
      ],
    );
  }
}

class DateInputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(DateTime value) onChanged;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final bool? readOnly;
  final DateTime? selectedDate;

  const DateInputField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    required this.onChanged,
    this.labelText,
    this.suffixIcon,
    this.onTap,
    this.readOnly,
    this.validator, this.selectedDate,
  });

  @override
  State<DateInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.controller == null) {
        if(widget.selectedDate!=null) {
          textEditingController.text =
              DateFormat.yMMMMd().format(widget.selectedDate!);
          setState(() {});
        }
      }
    });
  }

  @override
  void didUpdateWidget(covariant DateInputField oldWidget) {
    // TODO: implement didUpdateWidget
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.controller == null) {
        if(widget.selectedDate!=null) {
          textEditingController.text =
              DateFormat.yMMMMd().format(widget.selectedDate!);
          setState(() {});
        }
      }
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              widget.labelText!,
              style: GilroyFonts.gilroyMediumStyle(
                fontSize: 18,
                fontWeight: FontWeight.w100,
                letterSpacing: 0.20,
              ),
            ),
          ),
        GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showModalBottomSheet<DateTime?>(
              context: context,
              builder: (BuildContext context) {
                return DatePickerDialog(
                  firstDate:
                      DateTime(1976, DateTime.now().month, DateTime.now().day),
                  lastDate: DateTime.now(),
                );
              },
            );
            if (pickedDate != null) {
              if (widget.controller == null) {
                textEditingController.text =
                    DateFormat.yMMMMd().format(pickedDate);
                setState(() {});
              }
              widget.onChanged(pickedDate);
            }
          },
          child: AbsorbPointer(
            child: TextFormField(
              controller: widget.controller ?? textEditingController,
              decoration: InputDecoration(
                hintText: widget.hintText,
                prefixIcon: Icon(
                  widget.prefixIcon ?? Icons.calendar_today,
                ),
                suffixIcon: Icon(
                  widget.suffixIcon ?? Icons.keyboard_arrow_down,
                ),
                contentPadding:
                     EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                hintStyle: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.28,
                  color: Colors.grey,
                ),
              ),
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.28,
              ),
              readOnly: true,
            ),
          ),
        ),
      ],
    );
  }
}

class MultiSelectForm extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(List<String> value) onChanged;
  final String? Function(String?)? validator;
  final List<String> options;
  final List<String> selectedOptions;
  final VoidCallback? onTap;
  final bool? readOnly;

  const MultiSelectForm({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    required this.onChanged,
    this.labelText,
    this.suffixIcon,
    required this.options,
    this.onTap,
    this.readOnly,
    this.validator,
    required this.selectedOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null)
          Padding(
            padding: EdgeInsets.only(
              bottom: 8.h,
            ),
            child: Text(
              labelText ?? "",
              style: GilroyFonts.gilroyMediumStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.20,
              ),
            ),
          ),
        Padding(
          padding: EdgeInsets.only(
            left: 1.w,
          ),
          child: Wrap(
            spacing: 8,
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            runSpacing: 8,
            children: List.generate(
              options.length,
              (index) {
                return CustomTabView(
                  title: options[index],
                  selected: selectedOptions.contains(options[index]),
                  locked: false,
                  radius: 15,
                  onTap: () {
                    List<String> alreadySelected = selectedOptions;
                    if (alreadySelected.contains(options[index])) {
                      alreadySelected.remove(options[index]);
                    } else {
                      alreadySelected.add(options[index]);
                    }
                    onChanged(alreadySelected);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
