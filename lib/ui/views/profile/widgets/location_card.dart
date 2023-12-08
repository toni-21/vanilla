import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vanilla/ui/common/custom_text_button.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/utilities/constants/colors.dart';

Widget locationCard({required String address, required Function onDelete}) {
  return Card(
    borderOnForeground: false,
    margin: EdgeInsets.zero,
    color: AppColors.white,
    elevation: 1.0,
    child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
        decoration: BoxDecoration(
            color: AppColors.white,
            border:
                Border.all(width: 1, color: AppColors.black.withOpacity(0.15)),
            borderRadius: BorderRadius.circular(6.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 300.w,
              child: CustomTextDisplay(
                inputText: address,
                textFontSize: 14,
                textFontWeight: FontWeight.w400,
                noOfTextLine: 3,
              ),
            ),
            CustomTextButton(
              child: Icon(Icons.delete_outline, color: AppColors.midGray,),
              onPressed: () {
                onDelete();
              },
              overlayColor: AppColors.red,
            )
          ],
        )),
  );
}
