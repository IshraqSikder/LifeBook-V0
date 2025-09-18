import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/models/character.dart';
import 'package:life_book/screens/activities/activity_screen.dart';
import 'package:life_book/theme.dart';

class BottomNavBar extends StatefulWidget {
  final Character player;
  const BottomNavBar({super.key, required this.player});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              spacing: 10,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _buildNavBarItem(
                        'School',
                        'assets/icons/school.svg',
                        () {},
                      ),
                      // Container(height: 78, width: 0.5, color: Colors.black),
                      _buildNavBarItem(
                        'Assets',
                        'assets/icons/assets.svg',
                        () {},
                      ),
                    ],
                  ),
                ),
                // Container(height: 78, width: 0.5, color: Colors.black),
                SizedBox(width: 75.w, height: 105.h),
                // Container(height: 78, width: 0.5, color: Colors.black),
                Expanded(
                  child: Row(
                    children: [
                      _buildNavBarItem(
                        'Relationships',
                        'assets/icons/relationships.svg',
                        () {},
                      ),
                      // Container(height: 78, width: 0.5, color: Colors.black),
                      _buildNavBarItem(
                        'Activities',
                        'assets/icons/activities.svg',
                        () {
                          // handle activities button
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ActivityScreen(player: widget.player),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -15.h,
            left: 35.w,
            right: 40.w,
            child: Center(child: _buildFAB()),
          ),
        ],
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
        width: 68.w,
        height: 75.h,
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 4,
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: label == 'School'
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
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAB() {
    return GestureDetector(
      onTap: () => widget.player.incrementAge(),
      child: Container(
        width: 105.w,
        height: 105.h,
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
          color: AppColors.greenColor,
          shape: BoxShape.circle,
        ),
        child: Container(
          width: 105.w,
          height: 105.h,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: AppColors.greenColor,
            shape: BoxShape.circle,
            border: Border.all(
              width: 2.5.w,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Colors.white,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.white, size: 40.r),
              Text(
                'Age',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
