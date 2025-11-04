import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/services/user.dart';
import 'package:life_book/theme.dart';

class StatsSection extends StatelessWidget {
  // final Character player;
  final User player;
  const StatsSection({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
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
            children: player.gameStats.allStats.entries
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
              children: player.gameStats.allStats.entries
                  .map(
                    (stat) =>
                        // Obx(() => _buildStatProgressBar(stat.value.value)),
                        Obx(() => _buildStatProgressBar(stat.value.value)),
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
            width: (200 * (progress / 100)).w,
            height: 20.h,
            decoration: BoxDecoration(
              color: progress >= 20
                  ? AppColors.greenColor
                  : AppColors.orangeColor,
            ),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 5.w),
            child: Text(
              '$progress%',
              style: GoogleFonts.inter(
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
