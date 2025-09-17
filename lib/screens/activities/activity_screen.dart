import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/models/character.dart';
import 'package:life_book/screens/home/profile_header.dart';
import 'package:life_book/theme.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({super.key, required this.player});

  List<ActivityItem> ActivityItems = [
    ActivityItem(
      imageUrl: "assets/images/menu/human.png",
      title: "New Life",
      subtitle: "Start a new one",
    ),
    ActivityItem(
      imageUrl: "assets/images/menu/mic.png",
      title: "Sound Effects",
      subtitle: "Game Sound",
    ),
  ];

  final Character player;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileHeader(player: player),
          Container(
            width: double.infinity,
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(color: AppColors.blueColor),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 106,
              children: [
                SvgPicture.asset(
                  'assets/icons/cancel.svg',
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                Text(
                  'Activites',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 21,
            decoration: BoxDecoration(color: AppColors.textColor),
            child: Text(
              'All activities that are available',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListView.builder(
            itemCount: ActivityItems.length,
            itemBuilder: (BuildContext context, int index) {
              final item = ActivityItems[index];
              return SizedBox(
                width: double.infinity,
                height: 70.h,
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
                              "assets/images/menu/threedots.svg",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 1.h, thickness: 0.50, color: Colors.black),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ActivityItem {
  final String imageUrl;
  final String title;
  final String subtitle;

  ActivityItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}
