import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/screens/activities/activity_screen.dart';
import 'package:life_book/controllers/home_controller.dart';
import 'package:life_book/theme.dart';

class BottomNavBarNew extends StatelessWidget {
  const BottomNavBarNew({
    super.key,
    // required this.player,
    // required this.lifeStoryDiaryEntries,
    // required this.onAgeIncrement,
  });

  @override
  Widget build(BuildContext context) {
    // Find the already initialized HomeController
    final HomeController controller = Get.find<HomeController>();

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
              children: [
                Row(
                  children: [
                    _buildNavBarItem('School', 'assets/icons/school.svg', () {
                      // Handle School button tap
                    }),
                    _buildNavBarItem('Assets', 'assets/icons/assets.svg', () {
                      // Handle Assets button tap
                    }),
                  ],
                ),
                SizedBox(width: 95.w, height: 105.h),
                Row(
                  children: [
                    _buildNavBarItem(
                      'Relationships',
                      'assets/icons/relationships.svg',
                      () {
                        // Handle Relationships button tap
                      },
                    ),
                    _buildNavBarItem(
                      'Activities',
                      'assets/icons/activities.svg',
                      () {
                        Get.to(
                          () => ActivityScreen(player: controller.player),
                        ); // Use Get.to
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
            child: Center(
              child: _buildFAB(controller),
            ), // Pass controller to FAB
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
        width: 70.w,
        height: 75.h,
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Colors.black,
              width: 0.20.w,
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
            right: BorderSide(
              color: Colors.black,
              width: 0.20.w,
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 32.w,
              height: 32.h,
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
            SizedBox(height: 4.h),
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

  // Pass HomeController to _buildFAB
  Widget _buildFAB(HomeController controller) {
    return GestureDetector(
      onTap: () {
        controller.incrementAge(); // Call the controller's method
      },
      child: Container(
        width: 90.w,
        height: 110.h,
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
          color: AppColors.greenColor,
          shape: BoxShape.circle,
          boxShadow: const [
            // Use const for fixed lists
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Container(
          width: 95.w,
          height: 110.h,
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
