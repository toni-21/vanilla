import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/utilities/constants/colors.dart';

Widget trackOrderWidget(Function callback) {
  return InkWell(
    onTap: () {
      callback();
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColors.black),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on_outlined),
                Gap(4.h),
                CustomTextDisplay(
                  inputText: 'Track Order',
                  textFontSize: 16,
                  textFontWeight: FontWeight.w600,
                ),
                Gap(4.h),
                CustomTextDisplay(
                  inputText: 'Request a delivery quote',
                  textColor: AppColors.midGray,
                  textFontSize: 12,
                  textFontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward,
            size: 28.h,
          )
        ],
      ),
    ),
  );
}
