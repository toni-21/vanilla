import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/utilities/constants/colors.dart';

Widget profileRating(String? rating) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
      decoration: BoxDecoration(
          color: AppColors.black, borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star_rounded,
            color: AppColors.white,
          ),
          CustomTextDisplay(
            inputText: rating ?? '0,0',
            textFontSize: 14,
            textColor: AppColors.white,
            textFontWeight: FontWeight.w400,
          ),
        ],
      ));
}
