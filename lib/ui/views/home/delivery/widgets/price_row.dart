import 'package:flutter/material.dart';
import 'package:vanilla/ui/common/custom_text_display.dart';
import 'package:vanilla/utilities/function_helpers/amount_helper.dart';

Widget priceRow({required title, required subtitle, bool isBold = false}) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomTextDisplay(
        inputText: title,
        textFontSize: 14,
        textFontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
      ),
      CustomTextDisplay(
        inputText: AmountHelper.formatAmount(subtitle),
        textFontSize: 14,
        textFontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
      ),
    ],
  );
}
