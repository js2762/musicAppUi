import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/homescreen/homepage_view.dart';
import 'theme/app_theme.dart';
import 'theme/theme_controller.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final themeController = Get.put(ThemeController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: themeController.isLightMode.value ? AppThemeClass.lightTheme : AppThemeClass.darkTheme,
          //theme: AppThemeClass.lightTheme,
          //darkTheme: AppThemeClass.darkTheme,
          // darkTheme: ThemeData(
          //   colorScheme: ColorScheme.fromSeed(
          //     seedColor: Colors.deepPurple,
          //     background: const Color.fromARGB(255, 17, 20, 54),
          //   ),
          //   useMaterial3: true,
          // ),
          home: const HomePage(),
        );
      },
    );
  }
}

