import 'package:ds_test_task/common/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationRow extends StatelessWidget {
  final String title;
  final String value;
  final bool showBottomPadding;
  const InformationRow({
    super.key,
    required this.title,
    required this.value,
    this.showBottomPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: showBottomPadding ? 10.r : 0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.subTitle,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
