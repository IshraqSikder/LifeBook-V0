import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/views/appbar/custom_appbar.dart';
import 'package:life_book/views/home/bottom_navbar.dart';
import 'package:life_book/controllers/home_controller.dart';
import 'package:life_book/views/home/life_story.dart';
import 'package:life_book/views/home/profile_header.dart';
import 'package:life_book/views/menu/menu_screen.dart';

class HomeScreen extends StatelessWidget {
  final User player;
  final dynamic choice;
  const HomeScreen({super.key, required this.player, this.choice});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(
      HomeController(player: player, choice: choice),
    );

    final UserService userService = Get.find<UserService>();

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
                      final levels = userService.activeUser!.gameStats.levelsRx;

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
                  BottomNavBar(player: player),
                ],
              ),
      ),
    );
  }
}
