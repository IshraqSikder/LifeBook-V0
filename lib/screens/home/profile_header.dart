import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/models/character.dart';
import 'package:life_book/screens/profile/profile_popup.dart';
import 'package:life_book/theme.dart';

class ProfileHeader extends StatefulWidget {
  final Character player;
  const ProfileHeader({super.key, required this.player});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showProfilePopup(context, widget.player),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColors.profileHeaderColor,
          border: Border(
            top: BorderSide(width: 1.w, color: const Color(0xFF303F52)),
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
                      widget.player.name,
                      style: GoogleFonts.inter(
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
                      child: SvgPicture.asset("assets/icons/profiles/info.svg"),
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
                    Text(
                      'Infant',
                      style: GoogleFonts.inter(
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
            Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$0',
                  style: GoogleFonts.inter(
                    color: AppColors.blueColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.48.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Bank Balance',
                  style: GoogleFonts.inter(
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
  }
}
