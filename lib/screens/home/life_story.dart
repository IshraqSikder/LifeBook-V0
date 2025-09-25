import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/theme.dart';

class LifeStory extends StatelessWidget {
  final int? age;
  final String description;

  const LifeStory({super.key, this.age, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        Text(
          'Age: $age years',
          style: GoogleFonts.inter(
            color: AppColors.blueColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          description,
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
