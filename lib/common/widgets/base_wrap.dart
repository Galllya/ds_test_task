import 'package:ds_test_task/common/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseWrap extends StatelessWidget {
  final List<String> items;
  const BaseWrap({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.r,
      runSpacing: 10.r,
      children: [
        for (String pecularitie in items)
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.wrap,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 2.r,
                horizontal: 6.r,
              ),
              child: Text(
                pecularitie,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.wrapText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
