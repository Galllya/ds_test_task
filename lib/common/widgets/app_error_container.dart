import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppErrorContainer extends StatelessWidget {
  final VoidCallback reload;
  const AppErrorContainer({
    super.key,
    required this.reload,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "An error occurred, please try again later",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20.r),
          ElevatedButton(
            onPressed: reload,
            child: const Text("Try Again"),
          ),
        ],
      ),
    );
  }
}
