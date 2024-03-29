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

class NameView extends StackedView<OnboardingViewModel> {
  const NameView({Key? key}) : super(key: key);

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
                inputText: 'Tell us your name',
                textFontSize: 20,
                textFontWeight: FontWeight.w600,
              ),
              Gap(16.h),
              CustomTextFormField(
                showTitle: true,
                titleText: 'First name',
                hintText: 'Enter first name',
                controller: viewModel.firstNameController,
                validator: (value) {
                  if (value == null || value.length < 3) {
                    return 'Please return a valid name';
                  }
                  return null;
                },
              ),
              Gap(16.h),
              CustomTextFormField(
                showTitle: true,
                titleText: 'Last name',
                hintText: 'Enter last name',
                controller: viewModel.lastNameController,
                validator: (value) {
                  if (value == null || value.length < 3) {
                    return 'Please return a valid name';
                  }
                  return null;
                },
              ),
              Gap(16.h),
              CustomTextFormField(
                showTitle: true,
                titleText: 'Phone number',
                hintText: 'Enter phone number',
                controller: viewModel.phoneNumberController,
                validator: (value) {
                  if (!ValidationHelper.isValidPhone(value)) {
                    return 'Please return a valid phone number';
                  }
                  return null;
                },
              ),
              Gap(40.h),
              CustomButton(
                buttonText: 'Continue',
                isLoading: viewModel.isBusy,
                onPressed: () {
                  viewModel.nameContinueFunction(context);
                },
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
