import 'package:ds_test_task/common/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseContainer extends StatelessWidget {
  final Widget child;
  final bool showTopBorderRadius;
  const BaseContainer({
    super.key,
    required this.child,
    this.showTopBorderRadius = true,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: showTopBorderRadius
            ? BorderRadius.circular(14)
            : const BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
        color: AppColors.secondBackgroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.r,
          vertical: 20.r,
        ),
        child: child,
      ),
    );
  }
}
