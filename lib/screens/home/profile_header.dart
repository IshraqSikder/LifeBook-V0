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
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
      decoration: BoxDecoration(color: AppColors.profileHeaderColor),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5.w,
            children: [
              GestureDetector(
                onTap: () => showProfilePopup(context, widget.player),
                child: SizedBox(
                  width: 38.w,
                  height: 38.h,
                  child: SvgPicture.asset(
                    "assets/icons/profiles/baby.svg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 14.w,
                    height: 14.h,
                    child: Image.asset(
                      "assets/images/flags/usa.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  SizedBox(
                    width: 14.w,
                    height: 14.h,
                    child: Image.asset(
                      "assets/images/apple.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.h,
                children: [
                  Text(
                    'Julian Slaughter',
                    style: GoogleFonts.inter(
                      color: AppColors.blueColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.blueColor,
                    ),
                  ),
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
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 4.h,
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
    );
  }
}
