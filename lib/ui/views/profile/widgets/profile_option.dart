import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:vanilla/ui/common/custom_divider.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/utilities/constants/images.dart';

Widget profileOption(
    {required String icon, required String name, required Function callback}) {
  return InkWell(
    onTap: () {
      callback();
    },
    child: Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            child: Row(
              children: [
                SvgPicture.asset(
                  icon == '' ? noImage : icon,
                  height: 25.h,
                ),
                Gap(6.w),
                CustomTextDisplay(
                  inputText: name,
                  textFontSize: 16,
                  textFontWeight: FontWeight.w400,
                ),
                Spacer(),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 30.h,
                ),
              ],
            )),
        CustomDivider(),
      ],
    ),
  );
}
