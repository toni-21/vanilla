import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/ui/views/auth/onboarding/onboarding_viewmodel.dart';
import 'package:vanilla/utilities/constants/colors.dart';
import 'package:vanilla/utilities/constants/images.dart';

class SetupView extends StackedView<OnboardingViewModel> {
  const SetupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(color: Colors.black.withOpacity(0.7), width: 6)),
            child: CustomTextDisplay(
              inputText: '10%',
              textFontSize: 24,
              textColor: AppColors.lightGrey,
            ),
          ),
          Gap(24.h),
          Shimmer.fromColors(
            baseColor: AppColors.primaryColor.withOpacity(0.85),
            highlightColor: Colors.grey.shade50,
            child: SvgPicture.asset(logoImage, semanticsLabel: 'logo'),
          ),
          Gap(10.h),
          CustomTextDisplay(
            inputText: '${viewModel.firstName}, we’re setting up your app',
            textFontSize: 16,
            textColor: AppColors.lightGrey,
          ),
          Gap(24.h),
        ],
      )),
    );
  }

  @override
  void onViewModelReady(OnboardingViewModel viewModel) {
    SchedulerBinding.instance
        .addPostFrameCallback((timeStamp) => viewModel.setupFunction());
    super.onViewModelReady(viewModel);
  }

  @override
  OnboardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingViewModel();
}
