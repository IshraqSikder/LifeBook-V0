import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/models/character.dart';
import 'package:life_book/theme.dart';

class ProfilePopup extends StatelessWidget {
  final Character player;

  const ProfilePopup({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
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
                // Profile header
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [AppColors.redColor, Color(0xFFFFFFFF)],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Avatar
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 24.w),
                            width: 50.w,
                            height: 50.h,
                            child: SvgPicture.asset(
                              'assets/icons/profiles/baby.svg',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            player.name,
                            style: GoogleFonts.inter(
                              color: AppColors.brownColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'You',
                        style: GoogleFonts.inter(
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

                // Profile title with search icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8.w,
                  children: [
                    Image.asset(
                      'assets/images/search.png',
                      width: 18.w,
                      height: 18.h,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'Profile',
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // Profile content
                Container(
                  margin: EdgeInsets.only(
                    left: 25.w,
                    right: 25.w,
                    bottom: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile details
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildProfileDetail('Relationship:', 'User'),
                          SizedBox(height: 8),
                          _buildProfileDetail('Age:', player.age.toString()),
                          SizedBox(height: 8),
                          _buildProfileDetail('Gender:', player.gender),
                          SizedBox(height: 8),
                          _buildProfileDetail('Occupation:', 'None'),
                        ],
                      ),

                      SizedBox(height: 24.h),

                      // Stats section
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Column 1: Labels
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: player.allStats.entries
                                .map((stat) => _buildStatLabel(stat.key))
                                .toList(),
                          ),

                          SizedBox(width: 15.w),

                          // Column 2: Gray Bar
                          Container(
                            height: 120.h,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.5.w,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: AppColors.brownColor,
                                ),
                              ),
                            ),
                          ),
                          // Column 3: Progress Bars
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: player.allStats.entries
                                  .map(
                                    (stat) => Obx(
                                      () => _buildStatProgressBar(
                                        stat.value.value,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Cancel Button
          Positioned(
            top: -10.h,
            left: -10.w,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 0,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.close,
                  color: AppColors.redColor,
                  size: 20.r,
                  weight: 800.0.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileDetail(String label, String value) {
    return Container(
      width: double.infinity,
      color: Color(0xFFEDECE8),
      padding: EdgeInsets.all(5.r),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: label,
              style: GoogleFonts.inter(
                color: AppColors.brownColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            TextSpan(
              text: ' $value',
              style: GoogleFonts.inter(
                color: AppColors.brownColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildStatLabel(String label) {
  return Container(
    height: 30.h,
    alignment: Alignment.centerRight,
    child: Text(
      label,
      textAlign: TextAlign.right,
      style: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.brownColor,
      ),
    ),
  );
}

Widget _buildStatProgressBar(int progress) {
  return Container(
    height: 30.h,
    alignment: Alignment.centerLeft,
    child: Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: 180.w,
          height: 20.h,
          decoration: BoxDecoration(color: AppColors.profileHeaderColor),
        ),
        Container(
          width: (180 * (progress / 100)).w,
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

// Function to show the profile popup
void showProfilePopup(BuildContext context, Character character) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black54.withValues(alpha: 0.90),
    builder: (BuildContext context) {
      return ProfilePopup(player: character);
    },
  );
}
