import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(75.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: double.infinity,
      toolbarHeight: 75.h,
      leading: Container(
        height: 75.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20.w,
          children: [
            GestureDetector(
              onTap: () {
                // handle menu button
                print("Menu Clicked");
              },
              child: Container(
                width: 40.w,
                height: 40.h,
                margin: EdgeInsets.only(top: 7.h),
                child: Image.asset(
                  "assets/images/menu.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8.w,
              children: [
                Container(
                  width: 38.w,
                  height: 38.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: SvgPicture.asset("assets/icons/logo.svg"),
                ),
                Text(
                  'LifeBook',
                  style: TextStyle(
                    color: AppColors.yellowColor,
                    fontSize: 28.sp,
                    fontFamily: GoogleFonts.jaro().fontFamily,
                    fontWeight: FontWeight.w400,
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
