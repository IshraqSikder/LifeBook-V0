import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/models/character.dart';
import 'package:life_book/screens/events/age_popup.dart';
import 'package:life_book/screens/home/home.dart';
import 'package:life_book/theme.dart';

class TutorialScreen extends StatelessWidget {
  final Character player;
  const TutorialScreen({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(32.r),
          decoration: BoxDecoration(
            backgroundBlendMode: BlendMode.softLight,
            color: Colors.black54,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/point.png',
                        width: 16.w,
                        height: 16.h,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        'Press',
                        style: GoogleFonts.inter(
                          color: AppColors.yellowColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        ' Age ',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'to grow older one year',
                        style: GoogleFonts.inter(
                          color: AppColors.yellowColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'at a time.',
                        style: GoogleFonts.inter(
                          color: AppColors.yellowColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Make choices as you go.',
                    style: GoogleFonts.inter(
                      color: AppColors.yellowColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Live your best(or worst) life.',
                    style: GoogleFonts.inter(
                      color: AppColors.yellowColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              // Age Button
              _buildTAB(context, player),
            ],
          ),
        ),
      ),
    );
  }

  // Built Age Button
  Widget _buildTAB(BuildContext context, Character player) {
    return GestureDetector(
      onTap: () async {
        await showAgePopup(context, player.age);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(player: player)),
        );
      },
      // onTap: () async {
      //   // Make onPressed async to use await
      //   // 1. Navigate to HomeScreen, replacing TutorialScreen
      //   await Navigator.pushReplacement(
      //     // Await the navigation to ensure it's complete
      //     context,
      //     MaterialPageRoute(builder: (context) => HomeScreen(player: player)),
      //   );

      //   // 2. Add a small, imperceptible delay to yield the frame.
      //   //    This ensures HomeScreen has fully rendered before attempting to show the dialog on top.
      //   await Future.delayed(
      //     Duration(milliseconds: 3000),
      //   ); // Or Duration(milliseconds: 10) if still experiencing issues

      //   // 3. Then, show the AgePopup.
      //   showAgePopup(context, player.age);
      // },
      child: Container(
        height: 110.h,
        width: 100.w,
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
          color: AppColors.textColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.redColor,
            strokeAlign: BorderSide.strokeAlignCenter,
            width: 3.w,
          ),
        ),
        child: Container(
          width: 105.w,
          height: 105.h,
          padding: EdgeInsets.all(5.r),
          decoration: BoxDecoration(
            color: AppColors.greenColor,
            shape: BoxShape.circle,
          ),
          child: Container(
            width: 105.w,
            height: 105.h,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: AppColors.greenColor,
              shape: BoxShape.circle,
              border: Border.all(
                width: 2.5.w,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Colors.white,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Colors.white, size: 40.r),
                Text(
                  'Age',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
