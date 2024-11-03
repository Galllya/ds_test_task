import 'package:ds_test_task/common/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class HotelAction extends StatelessWidget {
  final String icon;
  final String title;
  const HotelAction({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.r,
        right: 20.r,
        left: 20.r,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 30.r,
          ),
          SizedBox(width: 30.r),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Самое необходимое",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.subTitle,
                ),
              ),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            weight: 40.r,
          ),
        ],
      ),
    );
  }
}
