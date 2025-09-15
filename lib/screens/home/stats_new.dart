import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/theme.dart';

class StatsNew extends StatelessWidget {
  const StatsNew({super.key});

  static final List<_StatData> _statData = [
    _StatData('Happiness', 'assets/images/stats/happiness.png', 0.88),
    _StatData('Health', 'assets/images/stats/health.png', 0.90),
    _StatData('Smarts', 'assets/images/stats/smarts.png', 0.66),
    _StatData('Looks', 'assets/images/stats/looks.png', 0.16),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Column 1: Labels
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: _statData
                .map((stat) => _buildStatLabel(stat.label))
                .toList(),
          ),
          SizedBox(width: 15.w),
          // Column 2: Icons
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _statData
                .map((stat) => _buildStatIcon(stat.iconPath))
                .toList(),
          ),
          SizedBox(width: 15.w),
          // Column 3: Gray Bar
          Container(
            height: 140.h,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Colors.black.withValues(alpha: 0.10),
                ),
              ),
            ),
          ),
          // Column 3: Progress Bars
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _statData
                  .map((stat) => _buildStatProgressBar(stat.progress))
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
          fontSize: 16.sp,
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

  static Widget _buildStatProgressBar(double progress) {
    return Container(
      height: 35.h,
      alignment: Alignment.centerLeft,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            width: 250.w,
            height: 20.h,
            decoration: BoxDecoration(color: AppColors.profileHeaderColor),
          ),
          Container(
            width: (250 * progress).w,
            height: 20.h,
            decoration: BoxDecoration(
              color: progress >= 0.20
                  ? AppColors.greenColor
                  : AppColors.orangeColor,
            ),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 5.w),
            child: Text(
              '${(progress * 100).toInt()}%',
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

class _StatData {
  final String label;
  final String iconPath;
  final double progress;

  const _StatData(this.label, this.iconPath, this.progress);
}
