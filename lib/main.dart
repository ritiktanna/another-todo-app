import 'package:another_todo_app/app/data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/data/injector.dart';
import 'app/routes/app_pages.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Injector.init();
  runApp(
    ScreenUtilInit(
      builder:
          (context, child) => GetMaterialApp(
            title: "Another Todo App",
            initialRoute: AppPages.initial,
            getPages: AppPages.routes,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              checkboxTheme: CheckboxThemeData(
                fillColor: WidgetStateProperty.resolveWith<Color>((
                  Set<WidgetState> states,
                ) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.mainColor;
                  }
                  return Colors.transparent;
                }),
              ),
              primaryColor: AppColors.mainColor,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: AppColors.mainColor,
              ),
              scaffoldBackgroundColor: const Color(0xff232429),
              appBarTheme: AppBarTheme(
                color: Colors.transparent,
                centerTitle: true,
                surfaceTintColor: Colors.transparent,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                ),
              ),
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
    ),
  );
}
