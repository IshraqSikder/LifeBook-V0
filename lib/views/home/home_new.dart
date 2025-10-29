import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:life_book/models/character.dart';
import 'package:life_book/views/appbar/custom_appbar_new.dart';
import 'package:life_book/views/home/bottom_navbar_new.dart';
import 'package:life_book/controllers/home_controller.dart';
import 'package:life_book/screens/home/life_story.dart';
import 'package:life_book/screens/home/profile_header.dart';
import 'package:life_book/screens/home/stats_section.dart';
import 'package:life_book/screens/menu/menu_screen.dart';

class HomeScreenNew extends StatelessWidget {
  final Character? player;
  final dynamic choice;
  const HomeScreenNew({super.key, this.player, this.choice});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(
      HomeController(player: player!, choice: choice),
    );

    return Scaffold(
      appBar: CustomAppBarNew(
        player: controller.player,
        // onMenuToggle: controller.toggleMenu(), // Adapted to ValueChanged<bool>
      ),
      body: Obx(
        () => controller.isMenuToggled.value
            ? MenuScreen(player: controller.player)
            : Column(
                children: [
                  ProfileHeader(player: controller.player),
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
                              ...controller.lifeStoryDiaryEntries.map((entry) {
                                return Column(
                                  children: [
                                    LifeStory(
                                      age: entry.age,
                                      description: controller
                                          .getCombinedDescription(entry),
                                      flavor: entry.flavor,
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
                  BottomNavBarNew(
                    // player: controller.player,
                    // lifeStoryDiaryEntries: controller.lifeStoryDiaryEntries, // Pass the observable list
                    // onAgeIncrement: (LifeStory newStoryEntry) {
                    //   controller.incrementAgeAndAddStory(newStoryEntry);
                    // },
                  ),
                  StatsSection(player: controller.player),
                ],
              ),
      ),
    );
  }
}
