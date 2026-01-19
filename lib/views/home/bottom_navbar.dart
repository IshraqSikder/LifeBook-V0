import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:life_book/controllers/custom_animation_controller.dart';
import 'package:life_book/controllers/home_controller.dart';
import 'package:life_book/theme.dart';
import 'package:life_book/views/activities/activity_screen.dart';
import 'package:life_book/views/home/stats_section.dart';
import 'package:life_book/views/jobs/job_screen.dart';
import 'package:life_book/views/real_estates/asset_screen.dart';
import 'package:life_book/views/relationships/relationship_screen.dart';

import '../../models/user.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    final CustomAnimationController animationController = Get.put(CustomAnimationController());

    return Obx(
      () => AnimatedSlide(
        // If visible, offset is 0. If not, offset is 1 (completely shifted down)
        offset: animationController.isNavBarVisible.value
            ? Offset.zero
            : const Offset(0, 1),
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Column(
          children: [
            SizedBox(
              height: 105.h,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: 78.h,
                    color: AppColors.blueColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Obx(
                              () =>
                                  controller.player.gameStats.levelsRx.last.age <24?
                                  _buildNavBarItem(
                                      'School',
                                      'assets/icons/school.svg',
                                      () {
                                        // Handle School
                                      },
                                    )
                                  : _buildNavBarItem(
                                      'Job',
                                      'assets/icons/job.svg',
                                      () {
                                        // USE THE NEW NAVIGATION METHOD
                                        animationController.navigateToTabWithAnimation(
                                          JobScreen(player: controller.player),
                                        );
                                      },
                                    ),
                            ),
                            _buildNavBarItem(
                              'Assets',
                              'assets/icons/assets.svg',
                              () {
                                // USE THE NEW NAVIGATION METHOD
                                animationController.navigateToTabWithAnimation(
                                  AssetScreen(player: controller.player),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(width: 95.w, height: 105.h),
                        Row(
                          children: [
                            _buildNavBarItem(
                              'Relationships',
                              'assets/icons/relationships.svg',
                              () {
                                animationController.navigateToTabWithAnimation(RelationshipScreen());
                              },
                            ),
                            _buildNavBarItem(
                              'Activities',
                              'assets/icons/activities.svg',
                              () {
                                // USE THE NEW NAVIGATION METHOD
                                animationController.navigateToTabWithAnimation(
                                  ActivityScreen(),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -15.h,
                    left: 40.w,
                    right: 40.w,
                    child: Center(child: _buildFAB(controller)),
                  ),
                ],
              ),
            ),
            StatsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBarItem(
    String label,
    String iconPath,
    VoidCallback onPressed,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 70.w,
        height: 75.h,
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: Colors.black, width: 0.20.w),
            right: BorderSide(color: Colors.black, width: 0.20.w),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: label == 'School' || label == 'Job'
                    ? AppColors.orangeColor
                    : AppColors.pasteColor,
                shape: BoxShape.circle,
                border: Border.all(width: 0.50.w, color: Colors.white),
              ),
              child: SvgPicture.asset(
                iconPath,
                width: 5.w,
                height: 6.h,
                fit: BoxFit.scaleDown,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 10.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAB(HomeController controller) {
    return GestureDetector(
      onTap: () {
        controller.incrementAge();
      },
      child: Container(
        width: 90.w, height: 110.h,
        decoration: BoxDecoration(
          color: AppColors.greenColor,
          shape: BoxShape.circle,
          boxShadow: const [BoxShadow(color: Color(0x3F000000), blurRadius: 4, offset: Offset(0, 4))],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.greenColor,
            shape: BoxShape.circle,
            border: Border.all(width: 2.5.w, color: Colors.white),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.white, size: 40.r),
              Text('Age', style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w800)),
            ],
          ),
        ),
      ),
    );
  }
}
