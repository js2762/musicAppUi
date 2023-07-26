import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/resources/app_images.dart';
import 'package:music_app/theme/theme_controller.dart';

final themeController = Get.find<ThemeController>();

class HomePageController extends GetxController {
  RxList<String> musicType = [
    'Recommendation',
    'Trending',
    'Business',
    'K-pop',
    'Live Events',
    'Hip-Hop',
    'Gaming',
  ].obs;

  RxList<String> imagesPath = [
    AppImages.music1,
    AppImages.music2,
    AppImages.music3,
    AppImages.music4,
  ].obs;

  void selectedIndex(int index, BuildContext context) {
    if (index == 3) {
      showModalBottomSheet(
        context: context,
       // backgroundColor: Theme.of(context).colorScheme.background,
        builder: (_) {
          return Container(
            color: Theme.of(context).colorScheme.background,
            height: 100,
            width: double.infinity,
            child: Center(
              child: Transform.scale(
                scale: 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    themeController.toggleTheme();
                  },
                  child: const Text('Change ThemeMode'),
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
