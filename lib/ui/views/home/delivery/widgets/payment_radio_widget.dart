  import 'package:flutter/material.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/utilities/constants/colors.dart';

Widget paymentRadioWidget(
      {required title, required selectedValue, required Function callback}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Radio(
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
              value: title,
              groupValue: selectedValue,
              onChanged: (value) {
                callback(value);
              },
              activeColor: AppColors.accentColor,
            ),
            CustomTextDisplay(
              inputText: title,
              textFontSize: 14,
              textFontWeight: FontWeight.w400,
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
