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
import 'package:life_book/views/home/stats_section.dart';
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
      appBar: CustomAppBarNew(player: controller.player),
      body: Obx(
        () => controller.isMenuToggled.value
            ? MenuScreen()
            : Column(
                children: [
                  ProfileHeader(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        child: Obx(
                          () => Column(
                            // Use Obx here to react to list changes
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // List of life story entries
                              ...userService
                                  .activeUser!
                                  .gameStats
                                  .levelsRx
                                  .value
                                  .map((entry) {
                                    return Column(
                                      children: [
                                        LifeStory(
                                          age: entry.age,
                                          description: controller
                                              .getCombinedDescription(entry),
                                          // flavor: entry.flavor,
                                        ),
                                        SizedBox(height: 10.h),
                                      ],
                                    );
                                  }), // Convert to list
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  BottomNavBarNew(),
                  StatsSection(),
                ],
              ),
      ),
    );
  }
}
