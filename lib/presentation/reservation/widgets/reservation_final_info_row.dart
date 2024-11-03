import 'package:ds_test_task/common/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationFinalInfoRow extends StatelessWidget {
  final String title;
  final int value;
  final bool isLast;
  const ReservationFinalInfoRow({
    super.key,
    required this.title,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 10.r),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.subTitle,
            ),
          ),
          const Spacer(),
          Text(
            "$value ₽",
            style: TextStyle(
              fontSize: 14.sp,
              color: isLast ? AppColors.primary : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
