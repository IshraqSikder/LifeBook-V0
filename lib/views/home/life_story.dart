import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/theme.dart';

class LifeStory extends StatelessWidget {
  final int age;
  final String description;

  const LifeStory({
    super.key,
    required this.age,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Age: $age years',
          style: TextStyle(
            color: AppColors.blueColor,
            fontSize: 12.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          description,
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 10.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
