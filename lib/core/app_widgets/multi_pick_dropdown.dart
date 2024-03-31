import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_core_module/core/app_extension.dart';
import 'package:app_core_module/core/app_styles.dart';
import 'package:app_core_module/core/app_widgets/app_input_field.dart';
import 'package:app_core_module/core/app_widgets/primary_button.dart';
import 'package:app_core_module/core/color_constant.dart';
import 'package:app_core_module/core/common_data/configurable_data_model/configurable_data_model.dart';

import 'custom_tab_view.dart';

typedef SelectedWidgetBuilder<Widget> = Function(List<String> item);
typedef AppSelectedWidgetBuilder<Widget> = Function(
    List<ConfigurableDataModel> item);

class MultiSelectDropDownWidget extends StatelessWidget {
  final bool isViewOnly;
  final Widget popupIcon;
  final Widget? suffixIcon;
  final bool filled;
  final List<String> selectedOptions;
  final List<String>? options;
  final bool? isRequired;
  final String? labelText;
  final String? hintText;
  final Function(List<String> documents) onChanged;
  final Function()? onClearTap;
  final String? Function(List<String>? value)? validator;
  final bool? showId;
  final List myCurrentVillages;
  final Future<List<String>> Function()? futureQuery;
  final Future<bool?> Function(dynamic)? onBeforePopupOpening;
  final SelectedWidgetBuilder? selectedWidgetBuilder;

  const MultiSelectDropDownWidget({
    super.key,
    this.myCurrentVillages = const [],
    this.filled = false,
    this.onClearTap,
    this.onBeforePopupOpening,
    required this.onChanged,
    this.selectedOptions = const [],
    this.hintText,
    this.labelText,
    this.isRequired,
    this.options,
    this.suffixIcon,
    this.validator,
    this.popupIcon = const Icon(
      Icons.close,
      color: Colors.black,
    ),
    this.isViewOnly = false,
    this.showId,
    this.futureQuery,
    this.selectedWidgetBuilder,
  });

  String getOnReadOnly() {
    return selectedOptions.map((e) => e).toList().join(", ");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        isViewOnly
            ? AppInputField(
                controller: TextEditingController(text: getOnReadOnly()),
                labelText: labelText,
                onChanged: (value) {},
              )
            : multiSelect(context, selectedOptions, options, onChanged),
      ],
    );
  }

  Widget _customDropDownExampleMultiSelection(
      BuildContext context, List<String> selectedOptionss) {
    if (selectedOptionss.isEmpty) {
      return Container();
    }

    return view(selectedOptionss, context);
  }

  Widget view(List<String> e, BuildContext context) {
    if (selectedWidgetBuilder != null) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: selectedWidgetBuilder!(e),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        spacing: 10,
        //runSpacing: 10,
        children: e.map((e) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CustomTabView(
              title: e,
              selected: false,
              locked: false,
              borderColor: ColorConstant.divideColor1,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget multiSelect(
      BuildContext context, List<String> selectedOptions, options, onChange) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownSearch<String>.multiSelection(
          enabled: !isViewOnly,
          key: key,
          validator: validator,
          dropdownBuilder: (_, data) {
            if (selectedOptions.isNotEmpty) {
              return InkWell(
                onTap: () {
                  onChanged([]);
                },
                child: const Text(
                  "Close All",
                ),
              );
            } else {
              return Text(
                hintText ?? "",
                style: GoogleFonts.montserrat(
                  color: ColorConstant.hintTxtColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.28,
                ),
              );
            }
          },
          onBeforePopupOpening: onBeforePopupOpening,
          filterFn: (d, s) => (d).toLowerCase().contains(s.toLowerCase()),
          asyncItems: (value) {
            if ((options != null && options.isEmpty) && futureQuery != null) {
              return futureQuery!();
            } else {
              return Future.microtask(() => []);
            }
          },
          // autoValidateMode: AutovalidateMode.onUserInteraction,
          popupProps: PopupPropsMultiSelection.modalBottomSheet(
              modalBottomSheetProps: ModalBottomSheetProps(
                backgroundColor: context.getBrightnessBG,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                isScrollControlled: true,
                enableDrag: false,
                barrierDismissible: false,
              ),
              searchFieldProps: TextFieldProps(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 07,
                ),
                decoration: InputDecoration(
                  errorMaxLines: 3,
                  hintText: "Search",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintStyle: GoogleFonts.montserrat(
                    color: ColorConstant.hintTxtColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.28,
                  ),
                ),
              ),
              validationWidgetBuilder: (_, values) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: PrimaryButton(
                            title: "Done",
                            onTap: () {
                              Navigator.pop(_);
                              onChange(values);
                            },
                          )),
                    ),
                  ],
                );
              },
              selectionWidget: (_, d, b) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                  ),
                  child: Checkbox(
                    value: b,
                    activeColor: ColorConstant.primaryColor,
                    checkColor: context.getBrightnessBG,
                    onChanged: (b) {},
                  ),
                );
              },
              //disabledItemFn: (d) => selectedOptions.contains(d),
              showSelectedItems: true,
              showSearchBox: true,
              itemBuilder: (_, item, b) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    bottom: 3,
                    top: 3,
                  ),
                  child: Text(
                    item,
                  ),
                );
              },
              title: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Select",
                        style: GilroyFonts.gilroyExtraBoldStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              fit: FlexFit.tight,
              listViewProps: const ListViewProps(
                physics: BouncingScrollPhysics(),
              )),
          items: options ?? [],
          // onChanged: onChange,
          selectedItems: this.selectedOptions,
          compareFn: isViewOnly
              ? null
              : (st, vt) {
                  if (st == vt) {
                    return true;
                  }
                  return false;
                },
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              errorMaxLines: 3,
              hintText: "Search",
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              hintStyle: GoogleFonts.montserrat(
                color: ColorConstant.hintTxtColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.28,
              ),
            ),
          ),
          // selectedOptions: selectedOptions ?? "",
        ),
        _customDropDownExampleMultiSelection(context, selectedOptions)
      ],
    );
  }
}

class AppMultiSelectDropDownWidget extends StatelessWidget {
  final bool isViewOnly;
  final Widget popupIcon;
  final Widget? suffixIcon;
  final bool filled;
  final List<ConfigurableDataModel> selectedOptions;
  final List<ConfigurableDataModel>? options;
  final bool? isRequired;
  final String? labelText;
  final String? hintText;
  final Function(List<ConfigurableDataModel> documents) onChanged;
  final Function()? onClearTap;
  final String? Function(List<ConfigurableDataModel>? value)? validator;
  final bool? showId;
  final List myCurrentVillages;
  final Future<List<ConfigurableDataModel>> Function()? futureQuery;
  final Future<bool?> Function(dynamic)? onBeforePopupOpening;
  final AppSelectedWidgetBuilder? selectedWidgetBuilder;

  const AppMultiSelectDropDownWidget({
    super.key,
    this.myCurrentVillages = const [],
    this.filled = false,
    this.onClearTap,
    this.onBeforePopupOpening,
    required this.onChanged,
    this.selectedOptions = const [],
    this.hintText,
    this.labelText,
    this.isRequired,
    this.options,
    this.suffixIcon,
    this.validator,
    this.popupIcon = const Icon(
      Icons.close,
      color: Colors.black,
    ),
    this.isViewOnly = false,
    this.showId,
    this.futureQuery,
    this.selectedWidgetBuilder,
  });

  String getOnReadOnly() {
    return selectedOptions.map((e) => e).toList().join(", ");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        isViewOnly
            ? AppInputField(
                controller: TextEditingController(text: getOnReadOnly()),
                labelText: labelText,
                onChanged: (value) {},
              )
            : multiSelect(context, selectedOptions, options, onChanged),
      ],
    );
  }

  Widget _customDropDownExampleMultiSelection(
      BuildContext context, List<ConfigurableDataModel> selectedOptionss) {
    if (selectedOptionss.isEmpty) {
      return Container();
    }

    return view(selectedOptionss, context);
  }

  Widget view(List<ConfigurableDataModel> e, BuildContext context) {
    if (selectedWidgetBuilder != null) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: selectedWidgetBuilder!(e),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        spacing: 10,
        //runSpacing: 10,
        children: e.map((e) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CustomTabView(
              title: (e.key ?? "").replaceAll("_", "").capitalizeFirstLetter(),
              selected: false,
              locked: false,
              borderColor: ColorConstant.divideColor1,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget multiSelect(BuildContext context,
      List<ConfigurableDataModel> selectedOptions, options, onChange) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownSearch<ConfigurableDataModel>.multiSelection(
          enabled: !isViewOnly,
          key: key,
          validator: validator,
          dropdownBuilder: (_, data) {
            if (selectedOptions.isNotEmpty) {
              return InkWell(
                onTap: () {
                  onChanged([]);
                },
                child: const Text(
                  "Close All",
                ),
              );
            } else {
              return Text(
                hintText ?? "",
                style: GoogleFonts.montserrat(
                  color: ColorConstant.hintTxtColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.28,
                ),
              );
            }
          },
          onBeforePopupOpening: onBeforePopupOpening,
          filterFn: (d, s) =>
              (d.key ?? "").toLowerCase().contains(s.toLowerCase()),
          asyncItems: (value) {
            if ((options != null && options.isEmpty) && futureQuery != null) {
              return futureQuery!();
            } else {
              return Future.microtask(() => []);
            }
          },
          // autoValidateMode: AutovalidateMode.onUserInteraction,
          popupProps: PopupPropsMultiSelection.modalBottomSheet(
              modalBottomSheetProps:  ModalBottomSheetProps(
                backgroundColor: context.getBrightnessBG,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                isScrollControlled: true,
                enableDrag: false,
                barrierDismissible: false,
              ),
              searchFieldProps: TextFieldProps(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 07,
                ),
                decoration: InputDecoration(
                  errorMaxLines: 3,
                  hintText: "Search",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintStyle: GoogleFonts.montserrat(
                    color: ColorConstant.hintTxtColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.28,
                  ),
                ),
              ),
              validationWidgetBuilder: (_, values) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: PrimaryButton(
                            title: "Done",
                            onTap: () {
                              Navigator.pop(_);
                              onChange(values);
                            },
                          )),
                    ),
                  ],
                );
              },
              selectionWidget: (_, d, b) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                  ),
                  child: Checkbox(
                    value: b,
                    activeColor: ColorConstant.primaryColor,
                    checkColor: context.getBrightnessBG,
                    onChanged: (b) {},
                  ),
                );
              },
              //disabledItemFn: (d) => selectedOptions.contains(d),
              showSelectedItems: true,
              showSearchBox: true,
              itemBuilder: (_, item, b) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    bottom: 3,
                    top: 3,
                  ),
                  child: Text(
                    (item.key ?? "").replaceAll("_", "").capitalizeFirstLetter(),
                  ),
                );
              },
              title: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Select",
                        style: GilroyFonts.gilroyExtraBoldStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              fit: FlexFit.tight,
              listViewProps: const ListViewProps(
                physics: BouncingScrollPhysics(),
              )),
          items: options ?? [],
          // onChanged: onChange,
          selectedItems: this.selectedOptions,
          compareFn: isViewOnly
              ? null
              : (st, vt) {
                  if (st == vt) {
                    return true;
                  }
                  return false;
                },
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              errorMaxLines: 3,
              hintText: "Search",
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              hintStyle: GoogleFonts.montserrat(
                color: ColorConstant.hintTxtColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.28,
              ),
            ),
          ),
          // selectedOptions: selectedOptions ?? "",
        ),
        _customDropDownExampleMultiSelection(context, selectedOptions)
      ],
    );
  }
}
