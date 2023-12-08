import 'package:flutter/material.dart';
import 'package:vanilla/utilities/constants/colors.dart';

class CustomDivider extends StatelessWidget {
  final double? height;
  final double? thickness;
  final Color? color;
  const CustomDivider({Key? key, this.height, this.thickness, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      height: height,
      color: color ?? AppColors.gray3.withOpacity(0.25),
    );
  }
}
