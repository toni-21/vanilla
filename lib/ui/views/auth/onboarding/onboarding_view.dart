import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:vanilla/ui/common/base_ui.dart';
import 'package:vanilla/ui/common/custom_button.dart';
import 'package:vanilla/utilities/constants/colors.dart';
import 'package:vanilla/utilities/constants/images.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:gap/gap.dart';
import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingViewModel viewModel,
    Widget? child,
  ) {
    return BaseUi(backgroundColor: AppColors.secondaryColor, children: [
      Column(
        children: [
          Gap(250.h),
          SvgPicture.asset(onboardingRiderImage,
              semanticsLabel: 'onboardingRiderImage'),
          Gap(50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Your Gateway to ',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20.sp,
                      height: 1.36.h,
                      fontWeight: FontWeight.w600),
                  children: const [
                    TextSpan(
                        text: 'Fast Deliveries ',
                        style: TextStyle(color: AppColors.red)),
                    TextSpan(text: 'with Vanilla')
                  ]),
            ),
          ),
          Gap(8.h),
          CustomTextDisplay(
              inputText:
                  'Vanilla is here to redefine how you send and receive deliveries—making it quicker and more convenient.',
              noOfTextLine: 5,
              textAlign: TextAlign.center,
              textColor: AppColors.white.withOpacity(0.65),
              textFontSize: 14),
          Gap(24.h),
          CustomButton(
            buttonText: 'Get Started',
            onPressed: (){},
            margin: EdgeInsets.symmetric(horizontal: 16.w),
          ),
        ],
      )
    ]);
  }

  @override
  OnboardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingViewModel();
}
