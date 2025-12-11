import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/controllers/death_controller.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/theme.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DeathScreenController controller = Get.put(DeathScreenController());

    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              controller.endGame();
            },
            child: _buildMenuItem(menuItems[0]),
          ), // Start New Life
          _buildMenuItem(menuItems[1]), // Sound Effects
          Container(
            width: double.infinity,
            height: 68.h,
            padding: EdgeInsets.all(10).r,
            decoration: BoxDecoration(
              color: AppColors.pasteColor,
              border: Border(
                bottom: BorderSide(width: 1.w, color: Colors.black),
              ),
              borderRadius: BorderRadius.zero,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/menu/group.png",
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 10.w),
                Text(
                  'About Us!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildMenuItem(MenuItem item) {
  return Container(
    width: double.infinity,
    height: 70.h,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          width: 1.w,
          color: Colors.black,
          style: BorderStyle.solid,
        ),
      ),
      borderRadius: BorderRadius.zero,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Row(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // image
                  SizedBox(
                    width: 35.w,
                    height: 35.h,
                    child: Image.asset(item.imageUrl, fit: BoxFit.contain),
                  ),
                  SizedBox(width: 5.w),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // title
                        Text(
                          item.title,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: AppColors.blueColor,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        // subtitle
                        Text(
                          item.subtitle,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: AppColors.blueColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.36.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              // icon
              SizedBox(
                width: 35.w,
                height: 35.h,
                child: SvgPicture.asset(item.iconUrl, fit: BoxFit.contain),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class MenuItem {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String iconUrl;

  MenuItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.iconUrl,
  });
}

List<MenuItem> menuItems = [
  MenuItem(
    imageUrl: "assets/images/menu/human.png",
    title: "New Life",
    subtitle: "Start a new one",
    iconUrl: "assets/images/menu/threedot.svg",
  ),
  MenuItem(
    imageUrl: "assets/images/menu/mic.png",
    title: "Sound Effects",
    subtitle: "Game Sound",
    iconUrl: "assets/images/menu/correct.svg",
  ),
];
