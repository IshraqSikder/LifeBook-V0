import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/theme.dart';

class LifeStory extends StatelessWidget {
  final int age;
  final String description;
  final String? flavor;

  const LifeStory({
    super.key,
    required this.age,
    required this.description,
    this.flavor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Age: $age years',
          style: GoogleFonts.inter(
            color: AppColors.blueColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          description,
          style: GoogleFonts.inter(
            color: AppColors.textColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
        if (flavor != null)
          Text(
            flavor!,
            style: GoogleFonts.inter(
              color: AppColors.textColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
      ],
    );
  }
}
