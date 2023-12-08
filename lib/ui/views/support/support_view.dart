import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:vanilla/ui/common/base_ui.dart';
import 'package:vanilla/ui/common/custom_button.dart';
import 'package:vanilla/ui/common/custom_collapsable.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/ui/common/custom_text_form_field.dart';
import 'package:vanilla/ui/views/support/support_viewmodel.dart';
import 'package:vanilla/utilities/constants/colors.dart';

class SupportView extends StackedView<SupportViewModel> {
  const SupportView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SupportViewModel viewModel,
    Widget? child,
  ) {
    return BaseUi(allowBackButton: true, safeTop: true, children: [
      Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(height: 250.h, color: AppColors.accentColor),
              Expanded(
                child: Container(
                  color: AppColors.backgroundColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(16.h),
                  const CustomTextDisplay(
                    inputText: 'Ask us Anything',
                    textFontSize: 20,
                    textColor: AppColors.white,
                    textFontWeight: FontWeight.w600,
                  ),
                  CustomTextDisplay(
                    inputText:
                        'Or have a conversation with our online assistant.',
                    textFontSize: 14,
                    textColor: AppColors.white,
                    textFontWeight: FontWeight.w400,
                  ),
                  Gap(24.h),
                  CustomTextFormField(
                    hintText: 'Write a message....',
                    maxLines: 10,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'a message is needed';
                      }
                      return null;
                    },
                  ),
                  Gap(48.h),
                  CustomButton(buttonText: 'Send Message', onPressed: () {}),
                  Gap(16.h),
                  CustomButton(
                    buttonText: 'Chat with Us',
                    fontColor: AppColors.accentColor,
                    backgroundColor: Colors.transparent,
                    borderColor: AppColors.accentColor,
                    onPressed: () {},
                  ),
                  Gap(48.h),
                  CustomTextDisplay(
                    inputText: 'People also ask',
                    textFontSize: 16,
                    textFontWeight: FontWeight.w600,
                  ),
                  Gap(16.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: AppColors.black.withOpacity(0.15)),
                        borderRadius: BorderRadius.circular(6.r)),
                    child: Column(
                      children: [
                        CustomCollapsable(
                          preview: CustomTextDisplay(
                            inputText: '1. HOW TO TIP DRIVER ON DELIVERY',
                            textFontSize: 14,
                            textFontWeight: FontWeight.w600,
                          ),
                          child: Text(
                            'A kingdom covenant partner is one financially committed to the Grace Nation and the various ministry Directorates presided over by Gods servant Dr Chris Okafor on a monthly, quarterly or annual basis with specified kingdom love gifts. Like Aaron and hurl these ones uphold the hands of the visional of the liberation city in prayers and in giving to the necessity of the ministry.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Gap(16.h),
                        CustomCollapsable(
                          preview: CustomTextDisplay(
                            inputText: '1. HOW TO TIP DRIVER ON DELIVERY',
                            textFontSize: 14,
                            textFontWeight: FontWeight.w600,
                          ),
                          child: Text(
                            'A kingdom covenant partner is one financially committed to the Grace Nation and the various ministry Directorates presided over by Gods servant Dr Chris Okafor on a monthly, quarterly or annual basis with specified kingdom love gifts. Like Aaron and hurl these ones uphold the hands of the visional of the liberation city in prayers and in giving to the necessity of the ministry.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(48.h),
                ],
              ),
            ),
          ),
        ],
      )
    ]);
  }

  @override
  SupportViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SupportViewModel();
}
