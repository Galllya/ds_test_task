import 'package:ds_test_task/common/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagesContainer extends StatefulWidget {
  final List<String> images;
  const ImagesContainer({
    super.key,
    required this.images,
  });

  @override
  State<ImagesContainer> createState() => _ImagesContainerState();
}

class _ImagesContainerState extends State<ImagesContainer> {
  int _indicator = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 200.r,
          child: PageView(
            onPageChanged: (value) => setState(() {
              _indicator = value;
            }),
            children: [
              if (widget.images.isEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ColoredBox(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              for (String image in widget.images)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    image,
                    width: double.infinity,
                    height: 200.r,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return ColoredBox(
                        color: Colors.grey.withOpacity(0.5),
                        child: const Icon(
                          Icons.error,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
        if (widget.images.length > 1)
          Padding(
            padding: EdgeInsets.only(bottom: 10.r),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.pointsBack,
              ),
              child: Padding(
                padding: EdgeInsets.all(5.r),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < widget.images.length; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.r),
                        child: CircleAvatar(
                          radius: 4.r,
                          backgroundColor:
                              _indicator == i ? Colors.black : AppColors.points,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
