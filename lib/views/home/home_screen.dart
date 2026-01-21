import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/views/appbar/custom_appbar.dart';
import 'package:life_book/views/home/bottom_navbar.dart';
import 'package:life_book/controllers/home_controller.dart';
import 'package:life_book/views/home/life_story.dart';
import 'package:life_book/views/home/profile_header.dart';
import 'package:life_book/views/menu/menu_screen.dart';

class HomeScreen extends StatelessWidget {
  final User player;
  const HomeScreen({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(
      HomeController(player: player), permanent: true,
    );

    return Scaffold(
      appBar: CustomAppBarNew(),
      body: Obx(
        () => controller.isMenuToggled.value
            ? MenuScreen()
            : Column(
                children: [
                  ProfileHeader(),
                  Expanded(
                    child: Obx(() {
                      final levels = controller.player.gameStats.levelsRx;

                      return ListView.separated(
                        controller: controller.scrollController,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        itemCount: levels.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10.h),
                        itemBuilder: (context, index) {
                          final entry = levels[index];
                          return LifeStory(
                            age: entry.age,
                            description: controller.getCombinedDescription(
                              entry,
                            ),
                          );
                        },
                      );
                    }),
                  ),
                  BottomNavBar(),
                ],
              ),
      ),
    );
  }
}
