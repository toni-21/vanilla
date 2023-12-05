import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:vanilla/ui/common/base_ui.dart';
import 'package:vanilla/ui/common/custom_button.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/ui/common/custom_text_form_field.dart';
import 'package:vanilla/ui/views/home/home_viewmodel.dart';
import 'package:vanilla/ui/views/home/widgets/delivery_widget.dart';
import 'package:vanilla/ui/views/home/widgets/track_order_widget.dart';
import 'package:vanilla/utilities/constants/colors.dart';

class DashboardView extends StackedView<HomeViewModel> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return BaseUi(allowBackButton: true, safeTop: true, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          controller: viewModel.mainScrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(8.h),
              const CustomTextDisplay(
                inputText: 'Mide, send some packages today!',
                textFontSize: 16,
                textFontWeight: FontWeight.w600,
              ),
              Gap(24.h),
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
              Gap(22.h),
              CustomButton(buttonText: 'Continue', onPressed: () {}),
              Gap(40.h),
              trackOrderWidget(() {}),
              Gap(40.h),
              const CustomTextDisplay(
                inputText: 'Recent Deliveries',
                textFontSize: 16,
                textFontWeight: FontWeight.w600,
              ),
              Gap(16.h),
              deliveryWidget(),
              Gap(48.h),
            ],
          ),
        ),
      )
    ]);
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
