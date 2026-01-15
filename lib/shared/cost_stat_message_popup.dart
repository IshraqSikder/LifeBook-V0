import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme.dart';

class CostStatMessagePopup extends StatelessWidget {
  final String title;
  final String description;
  final int cost;
  final String effectStatKey;
  final double currentStatPercentage;
  const CostStatMessagePopup({
    super.key,
    required this.title,
    required this.description,
    required this.cost,
    required this.effectStatKey,
    required this.currentStatPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 305.w,
        height: 285.h,
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 15.h),
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
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: AppColors.brownColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    '\$$cost',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: AppColors.brownColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    effectStatKey,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: AppColors.blueColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Stack(
                    children: [
                      Container(
                        width: 160.w,
                        height: 18.h,
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                      ),
                      Container(
                        width: (160 * (currentStatPercentage).clamp(0.0, 1.0)).w,
                        height: 18.h,
                        decoration: (currentStatPercentage).clamp(0.0, 1.0) >= 0.20
                            ? BoxDecoration(color: AppColors.greenColor)
                            : BoxDecoration(color: AppColors.orangeColor),
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 5.w),
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
