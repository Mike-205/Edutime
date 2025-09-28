import 'package:edutime/config/theme/app_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/routes/app_navigation_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemeMode.lightTheme,
        darkTheme: AppThemeMode.darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: '/',
        routes: appNavigationRoutes,
      ),
    );
  }
}