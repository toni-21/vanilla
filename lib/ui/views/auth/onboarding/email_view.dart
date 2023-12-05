import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:vanilla/ui/common/base_ui.dart';
import 'package:vanilla/ui/common/custom_button.dart';
import 'package:vanilla/ui/common/custom_text_form_field.dart';
import 'package:vanilla/utilities/constants/colors.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:gap/gap.dart';
import 'package:vanilla/utilities/function_helpers/validation_helper.dart';
import 'onboarding_viewmodel.dart';

class EmailView extends StackedView<OnboardingViewModel> {
  const EmailView({Key? key}) : super(key: key);

  Widget orDivider() {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: AppColors.black.withOpacity(0.45),
            height: 1,
          ),
        ),
        CustomTextDisplay(
          inputText: '  or  ',
          textFontSize: 14,
          textLineHeight: 0.75,
          textColor: AppColors.black.withOpacity(0.45),
        ),
        Expanded(
          child: Container(
            color: AppColors.black.withOpacity(0.45),
            height: 1,
          ),
        )
      ],
    );
  }

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
                inputText: 'Enter your Email Address',
                textFontSize: 20,
                textFontWeight: FontWeight.w600,
              ),
              Gap(24.h),
              CustomTextFormField(
                hintText: 'vanilla@gmail.com',
                controller: viewModel.emailController,
                validator: (value) {
                  if (!ValidationHelper.isValidEmail(value)) {
                    return 'Sorry, your email address is incorrect';
                  }
                  return null;
                },
              ),
              Gap(24.h),
              orDivider(),
              Gap(16.h),
              CustomButton(
                buttonText: 'Continue',
                onPressed: () {
                  viewModel.emailContinueFunction(context);
                },
              ),
              Gap(24.h),
              CustomButton(
                buttonText: 'Continue with Google',
                icon: Icons.apple_sharp,
                iconColor: AppColors.black,
                backgroundColor: Colors.transparent,
                borderColor: AppColors.black,
                onPressed: () {},
              ),
              Gap(24.h),
              RichText(
                text: TextSpan(
                    text:
                        'By continuing, you agree to receive calls, WhatsApp messages, or SMS notifications. And that you also accept Vanilla’s ',
                    style: TextStyle(
                        color: AppColors.gray3,
                        fontSize: 12.sp,
                        height: 1.36.h,
                        fontWeight: FontWeight.w400),
                    children: const [
                      TextSpan(
                          text: 'Terms and Conditions',
                          style: TextStyle(
                              color: AppColors.blue,
                              decoration: TextDecoration.underline)),
                      TextSpan(text: ' including our '),
                      TextSpan(
                          text: 'Privacy policy.',
                          style: TextStyle(
                              color: AppColors.blue,
                              decoration: TextDecoration.underline)),
                    ]),
              ),
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
