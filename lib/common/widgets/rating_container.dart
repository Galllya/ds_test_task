import 'package:ds_test_task/common/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingContainer extends StatelessWidget {
  final int rating;
  final String ratingName;
  const RatingContainer({
    super.key,
    required this.rating,
    required this.ratingName,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.ratingBack,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 2.r,
          horizontal: 4.r,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star,
              color: AppColors.yellow,
            ),
            SizedBox(width: 4.r),
            Text(
              "$rating $ratingName",
              style: TextStyle(
                color: AppColors.yellow,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
