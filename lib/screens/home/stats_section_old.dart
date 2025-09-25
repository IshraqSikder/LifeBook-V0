import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/models/character.dart';
import 'package:life_book/theme.dart';

class StatsSectionOld extends StatefulWidget {
  final Character character;
  const StatsSectionOld({super.key, required this.character});

  @override
  State<StatsSectionOld> createState() => _StatsSectionOldState();
}

class _StatsSectionOldState extends State<StatsSectionOld> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),

      // padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 15.h),
      child: Container(
        color: Colors.yellow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatRow(
              'Happiness',
              'assets/images/stats/happiness.png',
              widget.character.happiness,
            ),
            _buildStatRow(
              'Health',
              'assets/images/stats/health.png',
              widget.character.health,
            ),
            _buildStatRow(
              'Smarts',
              'assets/images/stats/smarts.png',
              widget.character.smarts,
            ),
            _buildStatRow(
              'Looks',
              'assets/images/stats/looks.png',
              widget.character.looks,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String iconPath, int progress) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 90.w,
            child: Text(
              label,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.blueColor,
              ),
            ),
          ),
          Image.asset(iconPath, height: 20.h, width: 20.w),
          Stack(
            children: [
              Container(
                width: 200.w,
                height: 20.h,
                decoration: BoxDecoration(color: Colors.grey.shade300),
              ),
              Container(
                width: (200 * (progress / 100)).w,
                height: 20.h,
                decoration: progress >= 20
                    ? BoxDecoration(color: AppColors.greenColor)
                    : BoxDecoration(color: AppColors.orangeColor),
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
        ],
      ),
    );
  }
}
