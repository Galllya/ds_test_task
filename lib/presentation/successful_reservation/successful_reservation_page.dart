import 'package:ds_test_task/common/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SuccessfulReservationPage extends StatelessWidget {
  const SuccessfulReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackgroundColor,
      appBar: AppBar(
        title: const Text("Заказ оплачен"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              "assets/images/party_image.png",
              width: 100.r,
            ),
            Text(
              "Ваш заказ принят в работу",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
            SizedBox(height: 10.r),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.r),
              child: Text(
                "Подтверждение заказа №2701 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператара, вам на почту прийдет уведомление.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
            ),
            const Spacer(),
            const Divider(),
            SizedBox(height: 10.r),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: ElevatedButton(
                onPressed: () {
                  context.goNamed("hotel_selection");
                },
                child: const Text("Супер!"),
              ),
            ),
            SizedBox(height: 10.r),
          ],
        ),
      ),
    );
  }
}
