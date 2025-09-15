import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/screens/home/home.dart';
import 'package:life_book/theme.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
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
                spacing: 9.h,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5.w,
                    children: [
                      Image.asset(
                        'assets/images/world.png',
                        width: 16.w,
                        height: 16.h,
                        fit: BoxFit.scaleDown,
                      ),
                      Text(
                        'Press Age to grow older one year at a time.',
                        style: GoogleFonts.inter(
                          color: Color(0xFFFFEE02),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Make choices as you go.',
                    style: GoogleFonts.inter(
                      color: Color(0xFFFFEE02),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Live your best(or worst) life.',
                    style: GoogleFonts.inter(
                      color: Color(0xFFFFEE02),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              // Age Button
              _buildFAB(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildFAB(context) {
  return GestureDetector(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    ),

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
