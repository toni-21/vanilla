import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:vanilla/ui/common/base_ui.dart';
import 'package:vanilla/ui/common/custom_divider.dart';
import 'package:vanilla/ui/common/custom_text_button.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/ui/views/profile/profile_viewmodel.dart';
import 'package:vanilla/ui/views/profile/widgets/profile_option.dart';
import 'package:vanilla/ui/views/profile/widgets/profile_rating.dart';
import 'package:vanilla/utilities/constants/colors.dart';
import 'package:vanilla/utilities/constants/images.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return BaseUi(allowBackButton: true, safeTop: true, children: [
      SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTextDisplay(
                    inputText: 'My Profile',
                    textFontSize: 20,
                    textFontWeight: FontWeight.w600,
                  ),
                  CustomTextButton(
                    onPressed: () {
                      viewModel.goToEditProfile();
                    },
                    child: CustomTextDisplay(
                      inputText: 'Edit profile',
                      textFontSize: 14,
                      textColor: AppColors.accentColor,
                      textFontWeight: FontWeight.w400,
                    ),
                    overlayColor: AppColors.primaryColor,
                  )
                ],
              ),
            ),
            Gap(24.h),
            CircleAvatar(
              radius: 30.r,
              backgroundColor: AppColors.gray3.withOpacity(0.5),
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
            CustomDivider(thickness: 5.h),
            profileOption(
                icon: addressImage,
                name: 'Saved Addresses',
                callback: () {
                  viewModel.goToSavedLocation();
                }),
            profileOption(
                icon: referralsImage, name: 'Referrals', callback: () {}),
            CustomDivider(thickness: 16.h),
            profileOption(
                icon: updatesImage, name: 'New Updates', callback: () {}),
            profileOption(icon: faqImage, name: 'FAQs', callback: () {}),
            profileOption(icon: legalImage, name: 'Legal', callback: () {}),
            CustomDivider(thickness: 16.h),
            profileOption(
                icon: logoutImage,
                name: 'Log out',
                callback: () {
                  viewModel.showLogoutBottomSheet();
                }),
            profileOption(icon: deleteImage, name: 'Delete Account', callback: () {}),
            Gap(48.h)
          ],
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
