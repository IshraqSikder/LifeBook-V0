import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/controllers/home_controller.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/theme.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    final UserService userService = Get.find<UserService>();
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
      child: // Stats section
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Column 1: Labels
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            // children: player.allStats.entries
            children: controller.allStats.entries
                .map((stat) => _buildStatLabel(stat.key))
                .toList(),
          ),

          SizedBox(width: 15.w),

          // Column 2: Icons
          Column(
            children: [
              _buildStatIcon("assets/images/stats/happiness.png"),
              _buildStatIcon("assets/images/stats/health.png"),
              _buildStatIcon("assets/images/stats/smarts.png"),
              _buildStatIcon("assets/images/stats/looks.png"),
            ],
          ),

          SizedBox(width: 15.w),

          // Column 3: Progress Bars
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 2.w,
                  color: Colors.grey[300]!,
                  style: BorderStyle.solid,
                  // strokeAlign: BorderSide.strokeAlignCenter,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // children: player.allStats.entries
              children: controller.allStats.entries
                  .map(
                    (stat) =>
                        // Obx(() => _buildStatProgressBar(stat.value.value)),
                        Obx(
                          () => _buildStatProgressBar(
                            userService
                                .activeUser!
                                .gameStats
                                .allStats[stat.key]!
                                .value,
                          ),
                        ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildStatLabel(String label) {
    return Container(
      height: 35.h,
      alignment: Alignment.centerRight,
      child: Text(
        label,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.blueColor,
        ),
      ),
    );
  }

  static Widget _buildStatIcon(String iconPath) {
    return Container(
      height: 35.h,
      alignment: Alignment.center,
      child: Image.asset(iconPath, height: 20.h, width: 20.w),
    );
  }

  Widget _buildStatProgressBar(int progress) {
    return Container(
      height: 35.h,
      alignment: Alignment.centerLeft,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            width: 200.w,
            height: 20.h,
            decoration: BoxDecoration(color: AppColors.profileHeaderColor),
          ),
          Container(
            width: (200 * (progress.clamp(0, 100) / 100)).w,
            height: 20.h,
            decoration: BoxDecoration(
              color: progress.clamp(0, 100) >= 20
                  ? AppColors.greenColor
                  : AppColors.orangeColor,
            ),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 5.w),
            child: Text(
              '${progress.clamp(0, 100)}%',
              style: TextStyle(
                fontFamily: 'Inter',
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
