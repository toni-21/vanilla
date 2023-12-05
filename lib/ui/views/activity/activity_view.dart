import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:vanilla/ui/common/base_ui.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/ui/views/activity/activity_viewmodel.dart';
import 'package:vanilla/utilities/constants/colors.dart';
import 'package:vanilla/utilities/function_helpers/amount_helper.dart';

class ActivityView extends StackedView<ActivityViewModel> {
  const ActivityView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ActivityViewModel viewModel,
    Widget? child,
  ) {
    return BaseUi(allowBackButton: true, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 48),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(24.h),
              const CustomTextDisplay(
                inputText: 'Activities',
                textFontSize: 22,
                textFontWeight: FontWeight.w500,
              ),
              Gap(16.h),
              CustomTextDisplay(
                inputText: AmountHelper.formatAmount('500000'),
                textFontSize: 18,
                textFontWeight: FontWeight.w600,
              ),
              Gap(24.h),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: AppColors.primaryColor,
                      size: 16.h,
                    ),
                    CustomTextDisplay(
                      inputText: '  Learn more about your savings options',
                      textFontSize: 12,
                      textColor: AppColors.primaryColor,
                      textFontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }

  @override
  ActivityViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ActivityViewModel();
}
