import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vanilla/utilities/constants/colors.dart';
import 'package:vanilla/utilities/constants/images.dart';

class StarRating extends StatelessWidget {
  final Function callback;
  final double starSize;
  final double rating;
  final Color starColor;
  final Color emptyStarColor;

  const StarRating({
    Key? key,
    required this.callback,
    this.starSize = 24.0,
    this.rating = 0.0,
    this.starColor = Colors.orange,
    this.emptyStarColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) {
          return InkWell(
            onTap: () {
              callback(index);
            },
            child:
                // SvgPicture.asset(
                //   logoImage,
                //   height: starSize.h,
                //   color:
                //       index < rating.floor() ? AppColors.gold : AppColors.gray3,
                // )
                IconButton(
              icon: Icon(
                Icons.star_rounded,
                size: starSize.h,
                color: index < rating.floor()
                    ? AppColors.gold
                    : AppColors.midGray.withOpacity(0.3),
              ),
              onPressed: () {
                callback(index);
              },
            ),
            // SvgPict
            // Icon(
            //   index < model.ratingValue.floor()
            //       ? CupertinoIcons.star
            //       : (index < model.ratingValue.ceil()
            //           ? Icons.star_half_rounded
            //           : Icons.star_border_rounded),
            //   size: starSize,
            //   color: index < model.ratingValue ? starColor : emptyStarColor,
            // ),
          );
        },
      ),
    );
  }
}
