import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:vanilla/ui/common/base_ui.dart';
import 'package:vanilla/ui/common/custom_button.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/ui/views/home/delivery/delivery_viewmodel.dart';
import 'package:vanilla/ui/views/home/delivery/widgets/payment_radio_widget.dart';
import 'package:vanilla/ui/views/home/delivery/widgets/price_row.dart';

class DeliverySummaryView extends StackedView<DeliveryViewModel> {
  const DeliverySummaryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DeliveryViewModel viewModel,
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
              Gap(8.h),
              const CustomTextDisplay(
                inputText: 'Delivery Summary',
                textFontSize: 20,
                textFontWeight: FontWeight.w500,
              ),
              Gap(24.h),
              const CustomTextDisplay(
                inputText: 'Payment Details',
                textFontSize: 16,
                textFontWeight: FontWeight.w600,
              ),
              Gap(8.h),
              paymentRadioWidget(
                  title: 'Pay on Delivery',
                  selectedValue: viewModel.selectedPaymentMethod,
                  callback: (value) {
                    if (value != null) {
                      viewModel.selectPaymentMethod(value);
                    }
                  }),
              Gap(4.h),
              paymentRadioWidget(
                  title: 'Pay Online',
                  selectedValue: viewModel.selectedPaymentMethod,
                  callback: (value) {
                    if (value != null) {
                      viewModel.selectPaymentMethod(value);
                    }
                  }),
              Gap(24.h),
              const CustomTextDisplay(
                inputText: 'Price Breakdown',
                textFontSize: 16,
                textFontWeight: FontWeight.w600,
              ),
              Gap(16.h),
              priceRow(title: 'Delivery Fee', subtitle: '1500'),
              Gap(8.h),
              priceRow(title: 'Base Fee', subtitle: '500'),
              Gap(8.h),
              priceRow(title: 'Delivery Fare', subtitle: '500'),
              Gap(8.h),
              priceRow(title: 'Time Fare', subtitle: '500'),
              Gap(8.h),
              priceRow(title: 'Total', subtitle: '3000', isBold: true),
              Gap(256.h),
              CustomButton(
                buttonText: 'Confirm Order',
                onPressed: () {
                  viewModel.showConfirmPriceBottomSheet();
                },
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
  DeliveryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DeliveryViewModel();
}
