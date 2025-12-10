import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/theme.dart';

class SchoolPopup extends StatelessWidget {
  final User player;

  const SchoolPopup({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxWidth: 350).w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Color(0xFFE53100), width: 5.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 25.h),
            // School header
            Container(
              width: double.infinity,
              height: 35.h,
              padding: EdgeInsets.symmetric(horizontal: 12.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [AppColors.redColor, Color(0xFFFFFFFF)],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Education',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      letterSpacing: 0.5.sp,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // School title with search icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8.w,
              children: [
                Image.asset(
                  'assets/images/schools/school.png',
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.contain,
                ),
                Text(
                  'Elementary School',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // School content
            Container(
              margin: EdgeInsets.only(
                left: 25.w,
                right: 25.w,
                bottom: 20.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // School details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSchoolDetail('School:', 'Tyler Mayefield Elementary School', AppColors.cardFirstColor),
                      _buildSchoolDetail(
                        'Type:', 'Public', AppColors.cardSecondColor
                      ),
                      _buildSchoolDetail(
                        'Level:', 'Elementary School', AppColors.cardFirstColor
                      ),
                      _buildSchoolDetail('Years:', player.gameStats.levelsRx.last.age.toString(),AppColors.cardSecondColor),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5).r,
                        ),
                        elevation: 3,
                        shadowColor: const Color(0xFFBAB9B7),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 10.h,
                        ),
                      ),
                      child: Text(
                        'OK',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSchoolDetail(String label, String value, Color cardColor) {
    return Container(
      width: double.infinity,
      color: cardColor,
      padding: EdgeInsets.all(8.r),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: label,
              style: TextStyle(
                fontFamily: 'Inter',
                color: AppColors.brownColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextSpan(
              text: ' $value',
              style: TextStyle(
                fontFamily: 'Inter',
                color: AppColors.brownColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to show the profile popup
void showSchoolPopup(BuildContext context, User character) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black54.withValues(alpha: 0.90),
    builder: (BuildContext context) {
      return SchoolPopup(player: character);
    },
  );
}
