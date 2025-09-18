import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/models/character.dart';
import 'package:life_book/theme.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Character player;
  final ValueChanged<bool>? onMenuToggle;

  const CustomAppBar({super.key, required this.player, this.onMenuToggle});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(75.h);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.redColor,
      toolbarHeight: 75.h,
      leading: GestureDetector(
        onTap: () {
          setState(() {
            _isMenuOpen = !_isMenuOpen;

            widget.onMenuToggle?.call(_isMenuOpen);
          });
        },
        child: Container(
          width: 30.w,
          height: 30.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          margin: EdgeInsets.only(top: 7.h, bottom: 7.h),
          child: _isMenuOpen
              ? SvgPicture.asset("assets/icons/cancel.svg", fit: BoxFit.contain)
              : Image.asset("assets/images/menu.png", fit: BoxFit.contain),
        ),
      ),
      centerTitle: _isMenuOpen ? true : false,
      titleSpacing: 0,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // If menu is open, show "MAIN MENU"
          if (_isMenuOpen)
            Text(
              'MAIN MENU',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w900,
              ),
            )
          else // If menu is closed, show "LifeBook" logo and title
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 38.w,
                  height: 38.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(), // Added const
                  child: SvgPicture.asset("assets/icons/logo.svg"),
                ),
                SizedBox(width: 8.w),
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
    );
  }
}
