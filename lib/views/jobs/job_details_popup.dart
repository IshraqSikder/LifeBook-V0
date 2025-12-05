import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/controllers/job_controller.dart';
import 'package:life_book/theme.dart';
import 'package:life_book/views/jobs/job_model.dart';

class JobDetailsPopup extends StatelessWidget {
  const JobDetailsPopup({super.key, required this.item});

  final JobItem item;

  @override
  Widget build(BuildContext context) {
    final JobController controller = Get.find<JobController>();
    return Dialog(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            constraints: BoxConstraints(maxWidth: 350).w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Color(0xFF007DD1), width: 5.w),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Job header
                Container(
                  width: double.infinity,
                  height: 35.h,
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  margin: EdgeInsets.only(top: 35.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [Color(0xFF007DD1), Color(0xFFF8F7F3)],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Job Info',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          letterSpacing: 0.5.sp,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),

                // Job title with icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      item.imageUrl,
                      width: 35.w,
                      height: 35.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      item.title,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.deepBlueColor,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 35.h),

                // Job Details content
                Container(
                  margin: EdgeInsets.only(
                    left: 25.w,
                    right: 25.w,
                    bottom: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile details
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildJobDetail('Title:', item.title),
                          SizedBox(height: 8),
                          _buildJobDetail('Career:', item.title),
                          SizedBox(height: 8),
                          _buildJobDetail('Employer:', item.subtitle),
                          SizedBox(height: 8),
                          _buildJobDetail('Salary:', '\$${item.salary}'),
                        ],
                      ),

                      SizedBox(height: 25.h),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.resignJob();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF9B2727),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5).r,
                            ),
                            elevation: 3,
                            shadowColor: const Color(0xFFBAB9B7),
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 10.h,
                            ),
                          ),
                          child: Text(
                            'Resign',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Cancel Button
          Positioned(
            top: -10.h,
            left: -10.w,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 0,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.close,
                  color: AppColors.redColor,
                  size: 20.r,
                  weight: 800.0.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobDetail(String label, String value) {
    return Container(
      width: double.infinity,
      color: Color(0xFFEDECE8),
      padding: EdgeInsets.all(5.r),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: label,
              style: TextStyle(
                fontFamily: 'Inter',
                color: AppColors.deepBlueColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            TextSpan(
              text: ' $value',
              style: TextStyle(
                fontFamily: 'Inter',
                color: AppColors.deepBlueColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
