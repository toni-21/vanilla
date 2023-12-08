import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/models/body/action_warning.dart';
import 'package:vanilla/ui/common/custom_button.dart';
import 'package:vanilla/ui/common/custom_text_button.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/ui/views/profile/profile_viewmodel.dart';
import 'package:vanilla/utilities/constants/colors.dart';

class ActionWarningSheet extends StackedView<ProfileViewModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const ActionWarningSheet({
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
    final data = request.data as ActionWarningModel;
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
        // crossAxisAlignment: CrossAxisAlignment.start,
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
            inputText: request.title ?? '',
            noOfTextLine: 1,
            textFontSize: 16,
            textFontWeight: FontWeight.w600,
          ),
          Gap(24.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
                color: AppColors.midGray.withOpacity(0.115),
                borderRadius: BorderRadius.circular(8.r)),
            child: Column(
              children: [
                CustomTextDisplay(
                  inputText: request.description ?? '',
                  noOfTextLine: 1,
                  textAlign: TextAlign.center,
                  textFontSize: 13,
                  textColor: AppColors.black.withOpacity(0.65),
                  textFontWeight: FontWeight.w400,
                ),
                if (data.description != null) ...[
                  CustomTextDisplay(
                    inputText: data.description ?? '',
                    noOfTextLine: 3,
                    textAlign: TextAlign.center,
                    textFontSize: 15,
                    textFontWeight: FontWeight.w400,
                  ),
                ],
              ],
            ),
          ),
          Gap(24.h),
          CustomButton(
              buttonText: data.acceptText ?? '',
              backgroundColor: AppColors.accentColor,
              onPressed: () {
                Navigator.pop(context);
                if (data.onPressed != null) {
                  data.onPressed!();
                }
              }),
          Gap(16.h),
          CustomTextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: CustomTextDisplay(
                inputText: data.cancelText ?? 'Cancel',
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
