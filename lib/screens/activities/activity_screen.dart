import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/screens/activities/activity_model.dart';
import 'package:life_book/models/character.dart';
import 'package:life_book/screens/activities/activity_popup.dart';
import 'package:life_book/screens/home/profile_header.dart';
import 'package:life_book/theme.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key, required this.player});

  final Character player;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.profileHeaderColor,
        toolbarHeight: 0.h,
        elevation: 0,
      ),
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
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    'assets/icons/cancel.svg',
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 105.w),
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
          Expanded(
            child: ListView.builder(
              itemCount: activityItems.length,
              itemBuilder: (BuildContext context, int index) {
                final item = activityItems[index];
                return GestureDetector(
                  onTap: () {
                    // Handle icon tap
                    showActivityPopup(context, player, item);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 70.h,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 0.50.w, color: Colors.black),
                      ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 4.w,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                  "assets/images/menu/threedot.svg",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Divider(
                        //   height: 1.h,
                        //   thickness: 0.50,
                        //   color: Colors.black,
                        // ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
