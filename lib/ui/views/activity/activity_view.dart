import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:vanilla/ui/common/base_ui.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/ui/views/activity/activity_viewmodel.dart';
import 'package:vanilla/ui/views/activity/widgets/activity_tab.dart';
import 'package:vanilla/ui/views/home/widgets/delivery_widget.dart';
import 'package:vanilla/utilities/function_helpers/amount_helper.dart';

class ActivityView extends StackedView<ActivityViewModel> {
  const ActivityView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ActivityViewModel viewModel,
    Widget? child,
  ) {
    return BaseUi(allowBackButton: true, safeTop: true, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextDisplay(
                inputText: 'Activity',
                textFontSize: 20,
                textFontWeight: FontWeight.w500,
              ),
              Gap(16.h),
              activityTab(viewModel),
              CustomTextDisplay(
                inputText: AmountHelper.formatAmount('500000'),
                textFontSize: 18,
                textFontWeight: FontWeight.w600,
              ),
              Gap(24.h),
              deliveryWidget(),
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
