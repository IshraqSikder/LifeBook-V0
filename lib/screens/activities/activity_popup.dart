import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/models/character.dart';
import 'package:life_book/screens/activities/activity_model.dart';
import 'package:life_book/theme.dart';

class ActivityPopup extends StatelessWidget {
  final Character player;
  final ActivityItem item;

  const ActivityPopup({super.key, required this.player, required this.item});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 305.w,
        height: 275.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 5.w, color: Color(0xFF007DD1)),
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
              // Activity Title
              child: Text(
                item.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Color(0xFF176FD1),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            // SizedBox(height: 16.h),
            Container(
              width: 240.w,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Text(
                item.description,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              height: 24.h,
              decoration: BoxDecoration(color: const Color(0xFFEDECE8)),
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    'Cost: ',
                    style: GoogleFonts.inter(
                      color: AppColors.brownColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    item.price.toString(),
                    style: GoogleFonts.inter(
                      color: AppColors.brownColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              height: 40.h,
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Smarts',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.inter(
                      color: AppColors.blueColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Stack(
                    children: [
                      Container(
                        width: 170.w,
                        height: 20.h,
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                      ),
                      Container(
                        width: (170 * 0.40).w,
                        height: 20.h,
                        decoration: 0.40 >= 0.20
                            ? BoxDecoration(color: AppColors.greenColor)
                            : BoxDecoration(color: AppColors.orangeColor),
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 5.w),
                        child: Text(
                          '${(0.40 * 100).toInt()}%',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to show the activity popup
Future<dynamic> showActivityPopup(
  BuildContext context,
  Character character,
  ActivityItem item,
) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black54.withValues(alpha: 0.95),
    builder: (BuildContext context) {
      return ActivityPopup(player: character, item: item);
    },
  );
}
