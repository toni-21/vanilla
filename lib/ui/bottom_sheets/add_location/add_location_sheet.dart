import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/ui/common/custom_button.dart';
import 'package:vanilla/ui/common/custom_text_button.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/ui/common/custom_text_form_field.dart';
import 'package:vanilla/ui/views/profile/profile_viewmodel.dart';
import 'package:vanilla/utilities/constants/colors.dart';

class AddLocationSheet extends StackedView<ProfileViewModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const AddLocationSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 32.w,
                height: 4.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFE5E5E5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
            ],
          ),
          Gap(16.h),
          CustomTextDisplay(
            inputText: 'Add a new Location',
            noOfTextLine: 1,
            textFontSize: 16,
            textFontWeight: FontWeight.w600,
          ),
          Gap(24.h),
          CustomTextFormField(
            showTitle: true,
            titleText: 'New Location',
            hintText: 'Enter location',
            controller: viewModel.newLocationController,
            validator: (value) {
              if (value == null || value.length < 3) {
                return 'Please return a valid address';
              }
              return null;
            },
          ),
          Gap(16.h),
          CustomTextFormField(
            showTitle: true,
            titleText: 'Landmark',
            hintText: 'Enter location',
            controller: viewModel.landmarkController,
            validator: (value) {
              return null;
            },
          ),
          // Gap(16.h),
          // Container(
          //   height: 120.h,
          //   width: double.infinity,
          //   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          //   decoration: BoxDecoration(
          //       color: AppColors.midGray.withOpacity(0.115),
          //       borderRadius: BorderRadius.circular(8.r)),
          // ),
          Gap(24.h),
          CustomButton(
              buttonText: 'Done',
              backgroundColor: AppColors.accentColor,
              onPressed: () {
                Navigator.pop(context);
              }),
          Gap(16.h),
          CustomTextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: CustomTextDisplay(
                inputText: 'Cancel',
                noOfTextLine: 1,
                textAlign: TextAlign.center,
                textFontSize: 14,
                textFontWeight: FontWeight.w600,
              ),
              overlayColor: AppColors.accentColor),
          Gap(24.h),
        ],
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}
