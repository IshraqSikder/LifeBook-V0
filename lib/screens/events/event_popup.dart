import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/screens/events/events_popup_list.dart';
import 'package:life_book/screens/home/life_story.dart';
import 'package:life_book/theme.dart';

class EventPopup extends StatelessWidget {
  final int rndIndex;
  const EventPopup(this.rndIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    var rndEvent = eventsPopupList[rndIndex];
    return Dialog(
      child: Container(
        width: double.infinity,
        height: 410.h,
        constraints: BoxConstraints(maxWidth: 350).w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Color(0xFFE53100), width: 5.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Event header
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 250.w,
                height: 30.h,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 12.h),
                margin: EdgeInsets.symmetric(vertical: 25.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [AppColors.redColor, Colors.white],
                  ),
                ),
                child: Text(
                  'Car',
                  textAlign: TextAlign.end,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            // Event title with icon
            Container(
              padding: EdgeInsets.all(12.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SvgPicture.asset(
                  //   "assets/events/car.svg",
                  //   width: 35.w,
                  //   height: 35.h,
                  //   fit: BoxFit.contain,
                  // ),
                  SvgPicture.asset("assets/icons/logo.svg"),
                  SizedBox(width: 10.w),
                  Text(
                    rndEvent["title"],
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      color: AppColors.brownColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            // Event content
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                rndEvent["description"],
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: const Color(0xFF3D010B),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: 250.w,
              height: 25.h,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(color: const Color(0xFFEDECE8)),
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Repair: ',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF3D010B),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text: '\$265',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF3D010B),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25.h),

            // Choice Buttons
            _buildChoiceButton(rndEvent["choices"][0]["option"]),
            SizedBox(height: 10.h),
            _buildChoiceButton(rndEvent["choices"][1]["option"]),
          ],
        ),
      ),
    );
  }
}

Widget _buildChoiceButton(String option) {
  return SizedBox(
    width: 250.w,
    height: 40.h,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF007ACF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 3,
        shadowColor: const Color(0xFFBAB9B7),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      onPressed: () {
        // Add your onPressed logic here
        LifeStory(description: 'rndEvent["choices"][0]["flavor"]');
      },
      child: Text(
        option,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

// Function to show the profile popup
void showEventPopup(BuildContext context) {
  final random = Random();
  int rndnumber =
      random.nextInt(eventsPopupList.length) + 1; // 1 to size of EventPopupList
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black54.withValues(alpha: 0.90),
    builder: (BuildContext context) {
      return EventPopup(rndnumber);
    },
  );
}
