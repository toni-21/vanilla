import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:vanilla/ui/common/base_ui.dart';
import 'package:vanilla/ui/common/custom_button.dart';
import 'package:vanilla/ui/common/custom_dropdown.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/ui/common/custom_text_form_field.dart';
import 'package:vanilla/ui/views/home/delivery/delivery_viewmodel.dart';
import 'package:vanilla/utilities/constants/colors.dart';

class DeliveryDetailsView extends StackedView<DeliveryViewModel> {
  const DeliveryDetailsView({Key? key}) : super(key: key);

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
              Gap(12.h),
              const CustomTextDisplay(
                inputText: 'Delivery Details',
                textFontSize: 20,
                textFontWeight: FontWeight.w500,
              ),
              Gap(16.h),
              const CustomTextDisplay(
                inputText: 'Where are you sending from?',
                textFontSize: 16,
                textFontWeight: FontWeight.w600,
              ),
              Gap(4.h),
              CustomTextFormField(
                hintText: 'Enter pickup location',
                controller: viewModel.pickupController,
                validator: (value) {
                  return null;
                },
              ),
              Gap(24.h),
              const CustomTextDisplay(
                inputText: 'Where is it going?',
                textFontSize: 16,
                textFontWeight: FontWeight.w600,
              ),
              Gap(4.h),
              CustomTextFormField(
                hintText: 'Enter dropoff location',
                controller: viewModel.pickupController,
                validator: (value) {
                  return null;
                },
              ),
              Gap(16.h),
              CustomButton(
                buttonText: 'Add another delivery point',
                fontColor: AppColors.accentColor,
                icon: Icons.add_box_rounded,
                iconColor: AppColors.accentColor,
                backgroundColor: Colors.transparent,
                borderColor: AppColors.accentColor,
                onPressed: () {},
              ),
              Gap(24.h),
              const CustomTextDisplay(
                inputText: "Package Information",
                textFontSize: 16,
                textFontWeight: FontWeight.w600,
              ),
              Gap(24.h),
              const CustomTextDisplay(
                inputText: 'Sender’s name',
                textFontSize: 12,
                textFontWeight: FontWeight.w600,
              ),
              Gap(4.h),
              CustomTextFormField(
                hintText: 'Yongiduu',
                controller: viewModel.pickupController,
                validator: (value) {
                  return null;
                },
              ),
              Gap(16.h),
              const CustomTextDisplay(
                inputText: 'Sender’s Phone number',
                textFontSize: 12,
                textFontWeight: FontWeight.w600,
              ),
              Gap(4.h),
              CustomTextFormField(
                hintText: '090384342843',
                controller: viewModel.pickupController,
                validator: (value) {
                  return null;
                },
              ),
              Gap(16.h),
              const CustomTextDisplay(
                inputText: 'Receiver’s name',
                textFontSize: 12,
                textFontWeight: FontWeight.w600,
              ),
              Gap(4.h),
              CustomTextFormField(
                hintText: 'Yongiduu',
                controller: viewModel.pickupController,
                validator: (value) {
                  return null;
                },
              ),
              Gap(16.h),
              const CustomTextDisplay(
                inputText: 'Receiver’s Phone number',
                textFontSize: 12,
                textFontWeight: FontWeight.w600,
              ),
              Gap(4.h),
              CustomTextFormField(
                hintText: '090384342843',
                controller: viewModel.pickupController,
                validator: (value) {
                  return null;
                },
              ),
              Gap(16.h),
              const CustomTextDisplay(
                inputText: 'Package category',
                textFontSize: 12,
                textFontWeight: FontWeight.w600,
              ),
              Gap(4.h),
              CustomDropdown(
                  items: viewModel.categoryList,
                  hintText: 'Clothing',
                  errorTextActive: false,
                  value: viewModel.selectedCategory,
                  callback: (value) {
                    if (value != null) {
                      viewModel.selectCategory(value);
                    }
                  },
                  setInitialValue: false),
              Gap(24.h),
              CustomButton(
                buttonText: 'Proceed to Payment',
                onPressed: () {
                  viewModel.goToDeliverySummary();
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
