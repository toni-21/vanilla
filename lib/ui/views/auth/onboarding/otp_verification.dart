import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:vanilla/ui/common/base_ui.dart';
import 'package:vanilla/utilities/constants/colors.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:gap/gap.dart';
import 'onboarding_viewmodel.dart';

class OTPVerificationView extends StackedView<OnboardingViewModel> {
  final String type;
  const OTPVerificationView({Key? key, required this.type}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingViewModel viewModel,
    Widget? child,
  ) {
    return BaseUi(allowBackButton: true, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 48),
        child: Form(
          key: viewModel.emailFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButton(
                color: Colors.black,
              ),
              Gap(24.h),
              const CustomTextDisplay(
                inputText: 'Enter the 4 digit code sent to you at',
                textFontSize: 18,
                textFontWeight: FontWeight.w600,
              ),
              Gap(2.h),
              CustomTextDisplay(
                inputText: type == 'email' ?  viewModel.email : viewModel.phoneNumber,
                textFontSize: 18,
                textColor: AppColors.red,
                textFontWeight: FontWeight.w600,
              ),
              Gap(24.h),
              SizedBox(
                width: 200,
                child: PinCodeTextField(
                  length: 4,
                  appContext: context,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.scale,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldHeight: 36,
                    fieldWidth: 36,
                    borderWidth: 0,
                    borderRadius: BorderRadius.circular(6),
                    selectedColor: AppColors.black.withOpacity(0.5),
                    selectedFillColor: AppColors.white,
                    inactiveFillColor: Theme.of(context).cardColor,
                    inactiveColor: AppColors.black.withOpacity(0.2),
                    activeColor: AppColors.black.withOpacity(0.5),
                    activeFillColor: AppColors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onChanged: (String text) => viewModel.setOtp(text,type: type),
                  beforeTextPaste: (text) => true,
                ),
              ),
              Gap(2.h),
              TextButton(
                onPressed: () {},
                child: CustomTextDisplay(
                  inputText: 'Resend OTP (30s)',
                  textFontSize: 15,
                  textColor: AppColors.black.withOpacity(0.5),
                  textFontWeight: FontWeight.w600,
                ),
              ),
              Gap(24.h),
            ],
          ),
        ),
      )
    ]);
  }

  @override
  OnboardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingViewModel();
}

class OTPVerificationArguments {
  final String type;

  OTPVerificationArguments({required this.type});
}
