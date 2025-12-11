import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/theme.dart';
import 'package:life_book/models/job_model.dart';

class JobPopup extends StatelessWidget {
  final JobModel item;

  const JobPopup({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: double.infinity,
        height: 300.h,
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
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              // Job Title
              child: Text(
                "Welcome Abroad",
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
                "Welcome to ${item.subtitle}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: const Color(0xFF0A386C),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 25.h,
                  decoration: BoxDecoration(color: const Color(0xFFECEBE7)),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        '     Title: ',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: const Color(0xFF0A386C),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        item.title,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: const Color(0xFF0A386C),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 25.h,
                  decoration: BoxDecoration(color: const Color(0xFFF4F3EF)),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        '     Career: ',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: const Color(0xFF0A386C),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        item.title,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: const Color(0xFF0A386C),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 25.h,
                  decoration: BoxDecoration(color: const Color(0xFFECEBE7)),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        '     Employer: ',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: const Color(0xFF0A386C),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        item.subtitle,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: const Color(0xFF0A386C),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 25.h,
                  decoration: BoxDecoration(color: const Color(0xFFF4F3EF)),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        '     Salary: ',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: const Color(0xFF0A386C),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "\$${item.salary.toString()}",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: const Color(0xFF0A386C),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}

Widget alreadyApplyJob() {
  return Dialog(
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.all(20).r,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 5, color: AppColors.redColor),
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
              "Rejected",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                color: AppColors.redColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            child: Text(
              "You already have a job",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                color: AppColors.brownColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
