import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/views/profile/profile_popup.dart';
import 'package:life_book/theme.dart';

import '../../controllers/sound_service.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final UserService userService = Get.find<UserService>();

    // Observe the activeUser from the UserService
    return Obx(() {
      final User? player = userService.activeUser;

      if (player == null) {
        return const SizedBox.shrink();
      }

      return GestureDetector(
        onTap: () {
          showProfilePopup(context, player);
          Get.find<SoundService>().eventSound();
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: AppColors.profileHeaderColor,
            border: Border(
              bottom: BorderSide(width: 1.w, color: const Color(0xFF303F52)),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40.w,
                height: 40.h,
                child: SvgPicture.asset(
                  "assets/icons/profiles/baby.svg",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 5.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 13.w,
                        height: 13.h,
                        child: Image.asset(
                          "assets/images/flags/usa.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        player.userInfo.name,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: AppColors.blueColor,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.blueColor,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: SvgPicture.asset(
                          "assets/icons/profiles/info.svg",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 13.w,
                        height: 13.h,
                        child: Image.asset(
                          "assets/images/apple.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Obx(
                        () => Text(
                          'Age: ${player.gameStats.levelsRx.last.ageRx.value}',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: AppColors.blueColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.30.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              // Bank Balance
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${player.gameStats.balanceRx}',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: AppColors.blueColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.48.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Bank Balance',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: AppColors.blueColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.30.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
