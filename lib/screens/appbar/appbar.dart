import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/screens/home/home.dart';
import 'package:life_book/screens/menu/menu_screen.dart';
import 'package:life_book/theme.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(75.h);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool menuClicked = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 75.h,
      leading: GestureDetector(
        onTap: () {
          setState(() {
            // handle menu button
            menuClicked = !menuClicked;

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return menuClicked ? MenuScreen() : Home();
                },
              ),
            );
          });
        },
        child: Container(
          width: 30.w,
          height: 30.h,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          // margin: EdgeInsets.only(top: 7.h),
          child: menuClicked
              ? SvgPicture.asset("assets/icons/cancel.svg", fit: BoxFit.contain)
              : Image.asset("assets/images/menu.png", fit: BoxFit.contain),
        ),
      ),
      centerTitle: menuClicked ? true : false,
      titleSpacing: 0,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20.w,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              menuClicked
                  ? Text(
                      'MAIN MENU',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 38.w,
                          height: 38.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
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
        ],
      ),
    );
  }
}
