import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/utilities/constants/colors.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final bool errorTextActive;
  final bool setInitialValue;
  final double width;
  final Function callback;
  final String? value;
  final FocusNode? focusNode;
  const CustomDropdown(
      {required this.items,
      required this.hintText,
      required this.errorTextActive,
      this.width = 358,
      required this.callback,
      this.value,
      required this.setInitialValue,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: width.w),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField<String>(
          dropdownColor: AppColors.white,
          isDense: false,
          focusNode: focusNode,
          value: (setInitialValue)
              ? items.isNotEmpty
                  ? items[0]
                  : ''
              : value,
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: SizedBox(
                        width: width.w * 0.6,
                        child: CustomTextDisplay(
                          inputText: item,
                          textColor: AppColors.black,
                          textFontSize: 14,
                          textFontWeight: FontWeight.w500,
                        )),
                  ))
              .toList(),
          hint: Align(
            alignment: Alignment.centerLeft,
            child: CustomTextDisplay(
              inputText: hintText,
              textColor: AppColors.midGray,
              textFontSize: 13,
              textFontWeight: FontWeight.w400,
            ),
          ),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.gray3,
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: errorTextActive == true
                          ? AppColors.red
                          : AppColors.gray3,
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(8)),
              filled: true,
              fillColor: Theme.of(context).cardColor,
              contentPadding: EdgeInsets.zero),
          onChanged: (value) => callback(value),
          icon: Icon(Icons.keyboard_arrow_down_rounded,
              color: AppColors.gray3, size: 25.h),
        ),
      ),
    );
  }
}
