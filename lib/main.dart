import 'package:ds_test_task/common/di.dart';
import 'package:ds_test_task/common/routes.dart';
import 'package:ds_test_task/common/ui/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        splitScreenMode: true,
        minTextAdapt: true,
        child: MaterialApp.router(
          theme: AppTheme.theme,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          routerConfig: router,
        ),
      ),
    );
  }
}
