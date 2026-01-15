import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:life_book/theme.dart';

class StatMassagePopup extends StatelessWidget {
  final String title;
  final String description;
  final String statTitle;
  final RxDouble statValue;

  const StatMassagePopup({
    super.key,
    required this.title,
    required this.description,
    required this.statTitle,
    required this.statValue,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 25.h),
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
              // Conversation Title
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Color(0xFF176FD1),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 35.h),
            Obx(() => SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      statTitle,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: AppColors.blueColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            width: 160.w,
                            height: 18.h,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          Container(
                            width: (160 * statValue.value.clamp(0.0, 1.0)).w,
                            height: 18.h,
                            decoration: statValue.value.clamp(0.0, 1.0) >= 0.20
                                ? BoxDecoration(color: AppColors.greenColor)
                                : BoxDecoration(color: AppColors.orangeColor),
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 5.w),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
