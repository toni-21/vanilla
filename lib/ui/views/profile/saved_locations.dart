import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:vanilla/ui/common/base_ui.dart';
import 'package:vanilla/ui/common/custom_button.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/ui/views/profile/profile_viewmodel.dart';
import 'package:vanilla/ui/views/profile/widgets/location_card.dart';
import 'package:vanilla/utilities/constants/colors.dart';

class SavedLocationsView extends StackedView<ProfileViewModel> {
  const SavedLocationsView({Key? key}) : super(key: key);

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
              const CustomTextDisplay(
                inputText: 'Saved locations',
                textFontSize: 20,
                textFontWeight: FontWeight.w500,
              ),
              const CustomTextDisplay(
                inputText: 'Swipe to delete desired location',
                textFontSize: 14,
                textFontWeight: FontWeight.w400,
              ),
              Gap(24.h),
              locationCard(
                  address: 'No 10 Acme Road, Ikeja.',
                  onDelete: () {
                    viewModel.showDeleteLocationBottomSheet();
                  }),
              Gap(16.h),
              locationCard(
                  address: '20 Elsie Pierce street, Kofo Abayomi',
                  onDelete: () {}),
              Gap(16.h),
              locationCard(
                  address: 'University of Lagos, Akoka', onDelete: () {}),
              Gap(16.h),
              locationCard(address: 'No 10 Acme Road, Ikeja.', onDelete: () {}),
              Gap(16.h),
              locationCard(
                  address: 'Oceans Basket, Ojuelegba', onDelete: () {}),
              Gap(124.h),
              CustomButton(
                buttonText: 'Add a new location',
                fontColor: AppColors.accentColor,
                icon: Icons.add_box_rounded,
                iconColor: AppColors.accentColor,
                backgroundColor: Colors.transparent,
                borderColor: AppColors.accentColor,
                onPressed: () {
                  viewModel.showAddLocationBottomSheet();
                },
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
