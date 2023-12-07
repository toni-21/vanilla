import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/models/body/delivery_details.dart';
import 'package:vanilla/ui/bottom_sheets/confirm_price/confirm_price_sheet_viewmodel.dart';
import 'package:vanilla/ui/common/custom_button.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/utilities/constants/colors.dart';
import 'package:vanilla/utilities/function_helpers/amount_helper.dart';

class ConfirmPriceSheet extends StackedView<ConfirmPriceSheetViewModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const ConfirmPriceSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConfirmPriceSheetViewModel viewModel,
    Widget? child,
  ) {
    final data = request.data as DeliveryDetailsModel;
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
          Gap(16.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
                color: AppColors.midGray.withOpacity(0.115),
                borderRadius: BorderRadius.circular(8.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CustomTextDisplay(
                      inputText: request.description ?? '',
                      noOfTextLine: 1,
                      textFontSize: 14,
                      textFontWeight: FontWeight.w400,
                    ),
                    CustomTextDisplay(
                      inputText: AmountHelper.formatAmount(data.amount),
                      textFontSize: 16,
                      textFontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Gap(16.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
                color: AppColors.midGray.withOpacity(0.115),
                borderRadius: BorderRadius.circular(8.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 300.w,
                      child: RichText(
                        maxLines: 4,
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text:
                                'By clicking confirm, I warrant and agree to the ',
                            style: TextStyle(
                                color: AppColors.gray3,
                                fontSize: 12.sp,
                                height: 1.36.h,
                                fontWeight: FontWeight.w400),
                            children: [
                              TextSpan(
                                  text: 'Terms and Services',
                                  style: TextStyle(
                                      color: AppColors.accentColor,
                                      fontSize: 12.sp,
                                      height: 1.36.h,
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                text:
                                    ' and my package meets the Vanilla Package Guidelines',
                                style: TextStyle(
                                    color: AppColors.gray3,
                                    fontSize: 12.sp,
                                    height: 1.36.h,
                                    fontWeight: FontWeight.w400),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Gap(16.h),
          Gap(12.h),
          CustomButton(
              buttonText: 'Confirm Price',
              backgroundColor: AppColors.accentColor,
              onPressed: () {
                Navigator.pop(context);
                debugPrint('Amount is ${data.amount}');
                if (data.amount != null) {
                  viewModel.confirmAmount(data.amount!);
                }
              }),
          Gap(16.h),
        ],
      ),
    );
  }

  @override
  ConfirmPriceSheetViewModel viewModelBuilder(BuildContext context) =>
      ConfirmPriceSheetViewModel();
}
