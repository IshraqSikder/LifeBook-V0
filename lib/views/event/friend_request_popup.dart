import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:life_book/controllers/home_controller.dart';
import 'package:life_book/theme.dart';

import '../../controllers/sound_service.dart';
import '../../models/user.dart';

class RelationRequestPopup extends StatelessWidget {
  final Relationship profile;
  final VoidCallback onAccept;
  final String requestTitle;
  final String requestSubtitle;
  final String acceptButtonText;
  final String rejectButtonText;

  const RelationRequestPopup({
    super.key,
    required this.profile,
    required this.onAccept,
    required this.requestTitle,
    required this.requestSubtitle,
    required this.acceptButtonText,
    required this.rejectButtonText,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
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
              border: Border.all(color: Color(0xFFE53100), width: 5.w)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 25.h),
                // Profile header
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(right: 12.w),
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
                            width: 40.w,
                            height: 40.h,
                            child: Image.asset(
                              profile.imageUrl,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            profile.name,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: AppColors.brownColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        profile.relation,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 28.h),

                // Profile title with search icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8.w,
                  children: [
                    Image.asset(
                      'assets/images/friend_request.png',
                      width: 18.w,
                      height: 18.h,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      // 'New Friend',
                      requestTitle,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                // SizedBox(height: 20.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0.w, vertical: 22.h),
                  child: Text(
                    requestSubtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.brownColor,
                    ),
                  ),
                ),

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
                          _buildProfileDetail(
                            'Relationship:',
                            profile.relation,
                            true,
                          ),
                          _buildProfileDetail(
                            'Age:',
                            profile.age.toString(),
                            false,
                          ),
                          _buildProfileDetail('Gender:', profile.gender, true),
                          _buildProfileDetail(
                            'Occupation:',
                            profile.occupation,
                            false,
                          ),
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
                            children: controller.allStatsNpc(profile).entries
                                .map((stat) => _buildStatLabel(stat.key))
                                .toList(),
                          ),

                          SizedBox(width: 15.w),

                          // Column 2: Gray Bar
                          Container(
                            height: 100.h,
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
                              children: controller.allStatsNpc(profile).entries
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
                _buildChoiceButton(context, acceptButtonText, onAccept),
                SizedBox(height: 10.h),
                _buildChoiceButton(context, rejectButtonText, () {}),
                SizedBox(height: 25.h),
              ],
            ),
          ),

          // Cancel Button
          Positioned(
            top: -10.h,
            left: -10.w,
            child: GestureDetector(
              onTap: () {
                Get.find<SoundService>().cancelClick();
                Navigator.of(context).pop();
              },
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

  Widget _buildProfileDetail(String label, String value, bool color) {
    return Container(
      width: double.infinity,
      color: color ? Color(0xFFEDECE8) : Colors.white,
      padding: EdgeInsets.all(5.r),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: label,
              style: TextStyle(
                fontFamily: 'Inter',
                color: AppColors.brownColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            TextSpan(
              text: ' $value',
              style: TextStyle(
                fontFamily: 'Inter',
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
    height: 25.h,
    alignment: Alignment.centerRight,
    child: Text(
      label,
      textAlign: TextAlign.right,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 12.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.brownColor,
      ),
    ),
  );
}

Widget _buildStatProgressBar(int progress) {
  return Container(
    height: 25.h,
    alignment: Alignment.centerLeft,
    child: Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: 150.w,
          height: 20.h,
          decoration: BoxDecoration(color: AppColors.profileHeaderColor),
        ),
        Container(
          width: (150 * (progress / 100)).w,
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

Widget _buildChoiceButton(BuildContext context, String choice, VoidCallback action) {
  return Container(
    width: double.infinity,
    height: 40.h,
    margin: EdgeInsets.symmetric(horizontal: 20.w),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF007ACF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        elevation: 3,
        shadowColor: const Color(0xFFBAB9B7),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      ),
      onPressed: () {
        action();
        Get.find<SoundService>().eventSound();
        Navigator.of(context).pop();
      },
      child: Text(
        choice,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Inter',
          color: Colors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
