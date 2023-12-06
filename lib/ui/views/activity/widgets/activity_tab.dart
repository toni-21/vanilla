import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vanilla/models/body/activity_enum.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/ui/views/activity/activity_viewmodel.dart';
import 'package:vanilla/utilities/constants/colors.dart';

Widget activityTab(ActivityViewModel viewModel) {
  return Container(
    alignment: Alignment.center,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            viewModel.setActivity(ActivityEnum.ongoing);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            decoration: BoxDecoration(
                color: viewModel.selectedActivityTab == ActivityEnum.ongoing
                    ? AppColors.accentColor
                    : null,
                border: Border.all(
                    width: 1,
                    color: viewModel.selectedActivityTab == ActivityEnum.ongoing
                        ? AppColors.accentColor
                        : Colors.black.withOpacity(0.25)),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(6.r),
                  topLeft: Radius.circular(6.r),
                )),
            child: CustomTextDisplay(
              inputText: 'Ongoing',
              textColor: viewModel.selectedActivityTab == ActivityEnum.ongoing
                  ? AppColors.white
                  : AppColors.black,
              textFontSize: 14,
              textFontWeight: FontWeight.w400,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            viewModel.setActivity(ActivityEnum.completed);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            decoration: BoxDecoration(
                color: viewModel.selectedActivityTab == ActivityEnum.completed
                    ? AppColors.accentColor
                    : null,
                border: Border.all(
                    width: 1,
                    color:
                        viewModel.selectedActivityTab == ActivityEnum.completed
                            ? AppColors.accentColor
                            : Colors.black.withOpacity(0.25)),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(6.r),
                  topRight: Radius.circular(6.r),
                )),
            child: CustomTextDisplay(
              inputText: 'Completed',
              textColor: viewModel.selectedActivityTab == ActivityEnum.completed
                  ? AppColors.white
                  : AppColors.black,
              textFontSize: 14,
              textFontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ),
  );
}
