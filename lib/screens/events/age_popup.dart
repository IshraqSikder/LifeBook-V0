import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/models/age_popup_list.dart';

class AgePopup extends StatelessWidget {
  final int playerAge;
  const AgePopup(this.playerAge, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(20).r,
          margin: EdgeInsets.symmetric(horizontal: 36.w),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 5, color: const Color(0xFF007DD1)),
            borderRadius: BorderRadius.circular(16).r,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                child: Text(
                  "Age : $playerAge",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF176FD1),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                // popup text from age_popup_list.dart based on playerAge
                child: Text(
                  agePopupList[playerAge] ?? "Another year older!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF0A386C),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Function to show the Age popup
Future<dynamic> showAgePopup(BuildContext context, int playerAge) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black54.withValues(alpha: 0.75),
    builder: (BuildContext context) {
      return AgePopup(playerAge);
    },
  );
}
