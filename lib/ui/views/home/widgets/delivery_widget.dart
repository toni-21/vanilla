import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vanilla/ui/common/custom_button.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/ui/common/custom_text_form_field.dart';
import 'package:vanilla/ui/views/activity/widgets/starRatingWidget.dart';
import 'package:vanilla/utilities/constants/colors.dart';

Widget deliveryWidget(
    {bool showRating = false,
    bool showReview = false,
    bool showDriverInfo = false}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: AppColors.midGray),
        borderRadius: BorderRadius.circular(6),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: AppColors.black),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: CustomTextDisplay(
                inputText: '2 Packages are on the way',
                textColor: AppColors.black,
                textFontSize: 11,
                textFontWeight: FontWeight.w600,
              ),
            ),
            CustomTextDisplay(
              inputText: 'Today',
              textColor: AppColors.midGray,
              textFontSize: 13,
              textFontWeight: FontWeight.w500,
            ),
          ],
        ),
        Gap(12.h),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(4.h),
                Container(
                  height: 12.h,
                  width: 12.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                      border: Border.all(color: AppColors.primaryColor)),
                ),
                DottedLine(
                  direction: Axis.vertical,
                  alignment: WrapAlignment.center,
                  lineLength: 50.h,
                  lineThickness: 2.w,
                  dashLength: 8.h,
                  dashColor: AppColors.primaryColor,
                  dashGapLength: 4.h,
                  dashGapColor: Colors.transparent,
                  // dashGradient: [Colors.red, Colors.blue],
                  // dashRadius: 0.0,
                  // dashGapGradient: [Colors.red, Colors.blue],
                  // dashGapRadius: 0.0,
                ),
                Container(
                  height: 12.h,
                  width: 12.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: AppColors.primaryColor,
                      border: Border.all(color: AppColors.primaryColor)),
                ),
              ],
            ),
            Gap(2.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextDisplay(
                    inputText: 'Ikeja',
                    textColor: AppColors.black,
                    textFontSize: 14,
                    textFontWeight: FontWeight.w600,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextDisplay(
                        inputText: 'No 10 Acme Road',
                        textColor: AppColors.midGray,
                        textFontSize: 12,
                        textFontWeight: FontWeight.w400,
                      ),
                      CustomTextDisplay(
                        inputText: '9:00AM, Sept 15',
                        textColor: AppColors.midGray,
                        textFontSize: 12,
                        textFontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Gap(16.h),
                  CustomTextDisplay(
                    inputText: 'Yaba',
                    textColor: AppColors.black,
                    textFontSize: 14,
                    textFontWeight: FontWeight.w600,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextDisplay(
                        inputText: '270, Herbert Macaulay',
                        textColor: AppColors.midGray,
                        textFontSize: 12,
                        textFontWeight: FontWeight.w400,
                      ),
                      CustomTextDisplay(
                        inputText: '------    ', //'11:00AM, Sept 15',
                        textColor: AppColors.midGray,
                        textFontSize: 12,
                        textFontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        if (showDriverInfo) ...[
          Gap(24.h),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: AppColors.black),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: CustomTextDisplay(
                  inputText: 'Driver informaation',
                  textColor: AppColors.black,
                  textFontSize: 11,
                  textFontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Gap(12.h),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextDisplay(
                      inputText: 'Name:',
                      textFontSize: 12,
                      textFontWeight: FontWeight.w600,
                    ),
                    Gap(2.w),
                    CustomTextDisplay(
                      inputText: 'Idowu R',
                      textFontSize: 12,
                      textFontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextDisplay(
                      inputText: 'Plate Number:',
                      textFontSize: 12,
                      textFontWeight: FontWeight.w600,
                    ),
                    Gap(2.w),
                    CustomTextDisplay(
                      inputText: '213456',
                      textFontSize: 12,
                      textFontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              )
            ],
          ),
          Gap(2.h),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextDisplay(
                      inputText: 'Vehicle Type:',
                      textFontSize: 12,
                      textFontWeight: FontWeight.w600,
                    ),
                    Gap(2.w),
                    CustomTextDisplay(
                      inputText: 'Motorcycle',
                      textFontSize: 12,
                      textFontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextDisplay(
                      inputText: 'Destination In:',
                      textFontSize: 12,
                      textFontWeight: FontWeight.w600,
                    ),
                    Gap(2.w),
                    CustomTextDisplay(
                      inputText: '7 Minutes',
                      textFontSize: 12,
                      textFontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
        if (!showRating) ...[
          Gap(8.h),
          Align(
            alignment: Alignment.center,
            child: StarRating(starSize: 36, callback: () {}),
          ),
        ],
        if (!showReview) ...[
          Gap(16.h),
          CustomTextFormField(
            hintText: 'Add Review (Optional)',
            maxLines: 2,
            validator: (value) {
              return null;
            },
          ),
          Gap(16.h),
          CustomButton(buttonText: 'Continue', onPressed: () {}),
        ]
      ],
    ),
  );
}
