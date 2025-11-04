import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/services/user.dart';
import 'package:life_book/theme.dart';

class MenuScreen extends StatefulWidget {
  // final Character player;
  final User player;
  const MenuScreen({super.key, required this.player});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(player: widget.player),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: menuItems.length,
            itemBuilder: (BuildContext context, int index) {
              final item = menuItems[index];
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 10.h,
                      ),
                      child: Row(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 5.w,
                            children: [
                              // image
                              SizedBox(
                                width: 35.w,
                                height: 35.h,
                                child: Image.asset(
                                  item.imageUrl,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 4.h,
                                  children: [
                                    // title
                                    Text(
                                      item.title,
                                      style: GoogleFonts.inter(
                                        color: AppColors.blueColor,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    // subtitle
                                    Text(
                                      item.subtitle,
                                      style: GoogleFonts.inter(
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
                            child: SvgPicture.asset(
                              item.iconUrl,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
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
              spacing: 10.w,
              children: [
                Image.asset(
                  "assets/images/menu/group.png",
                  fit: BoxFit.contain,
                ),
                Text(
                  'About Us!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
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
