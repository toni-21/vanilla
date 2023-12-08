import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:vanilla/ui/common/base_ui.dart';
import 'package:vanilla/ui/common/custom_button.dart';
import 'package:vanilla/ui/common/custom_divider.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/ui/common/custom_text_form_field.dart';
import 'package:vanilla/ui/views/profile/profile_viewmodel.dart';
import 'package:vanilla/ui/views/profile/widgets/profile_rating.dart';
import 'package:vanilla/utilities/constants/colors.dart';

class EditProfileView extends StackedView<ProfileViewModel> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return BaseUi(allowBackButton: true, safeTop: true, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(
                color: Colors.black,
              ),
              Gap(12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomTextDisplay(
                    inputText: 'Edit Profile',
                    textFontSize: 20,
                    textFontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Gap(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 30.r,
                            backgroundColor: AppColors.gray3.withOpacity(0.5),
                          ),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 12.r,
                              backgroundColor: AppColors.accentColor,
                              child: Icon(Icons.edit_rounded,
                                  size: 16, color: AppColors.white),
                            ),
                          ),
                        ],
                      ),
                      Gap(8.h),
                      CustomTextDisplay(
                        inputText: 'John Doe',
                        textFontSize: 20,
                        textFontWeight: FontWeight.w600,
                      ),
                      CustomTextDisplay(
                        inputText: 'vanilla@gmail.com | +2349065432314',
                        textFontSize: 14,
                        textColor: AppColors.midGray,
                        textFontWeight: FontWeight.w400,
                      ),
                      Gap(8.h),
                      profileRating('4.5'),
                    ],
                  ),
                ],
              ),
              Gap(24.h),
              const CustomTextDisplay(
                inputText: 'Name',
                textFontSize: 16,
                textFontWeight: FontWeight.w600,
              ),
              Gap(4.h),
              CustomTextFormField(
                hintText: 'Yongiduu',
                suffixIcon:
                    Icon(Icons.edit_rounded, size: 18, color: AppColors.black),
                validator: (value) {
                  return null;
                },
              ),
              Gap(16.h),
              const CustomTextDisplay(
                inputText: 'Phone Number',
                textFontSize: 16,
                textFontWeight: FontWeight.w600,
              ),
              Gap(4.h),
              CustomTextFormField(
                hintText: '09034834934',
                inputType: TextInputType.number,
                suffixIcon:
                    Icon(Icons.edit_rounded, size: 18, color: AppColors.black),
                validator: (value) {
                  return null;
                },
              ),
              Gap(16.h),
              const CustomTextDisplay(
                inputText: 'Email Address',
                textFontSize: 16,
                textFontWeight: FontWeight.w600,
              ),
              Gap(4.h),
              CustomTextFormField(
                hintText: 'yong@test.com',
                suffixIcon:
                    Icon(Icons.edit_rounded, size: 18, color: AppColors.black),
                inputType: TextInputType.emailAddress,
                validator: (value) {
                  return null;
                },
              ),
              Gap(124.h),
              CustomButton(
                buttonText: 'Save Changes',
                onPressed: () {},
                fontSize: 15,
              ),
              Gap(48.h),
            ],
          ),
        ),
      )
    ]);
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
