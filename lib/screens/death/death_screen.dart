import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/models/character.dart';
import 'package:life_book/theme.dart';

class DeathScreenPopup extends StatelessWidget {
  final Character player;

  const DeathScreenPopup({super.key, required this.player});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 70.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              // height: 580.h,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF7C837B),
                border: Border.all(width: 5.r, color: const Color(0xFF303F52)),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/death.svg',
                    width: 100.w,
                    height: 90.h,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    player.name,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.jaro(
                      color: const Color(0xFFDADBD3),
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'AGED ${player.age} YEARS',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.jaro(
                      color: const Color(0xFFDADBD3),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Net Worth: ',
                          style: GoogleFonts.inter(
                            color: const Color(0xFFDBDBD3),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '\$252,538\n',
                          style: GoogleFonts.inter(
                            color: const Color(0xFFDBDBD3),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Residence: ',
                          style: GoogleFonts.inter(
                            color: const Color(0xFFDBDBD3),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'Salt Lake City, United States\n',
                          style: GoogleFonts.inter(
                            color: const Color(0xFFDBDBD3),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Career: ',
                          style: GoogleFonts.inter(
                            color: const Color(0xFFDBDBD3),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'Animator\n',
                          style: GoogleFonts.inter(
                            color: const Color(0xFFDBDBD3),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Education: ',
                          style: GoogleFonts.inter(
                            color: const Color(0xFFDBDBD3),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'University',
                          style: GoogleFonts.inter(
                            color: const Color(0xFFDBDBD3),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'My whole life felt like it was defined by my name. Slaughter. On the football field, that’s who I was. From a kid in Colorado to a champion at Alabama and then a superstar for the Chicago Bears, my life was a highlight reel of hard hits and roaring crowds.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: const Color(0xFFB1B3A6),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.all(10.0).r,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Agreement',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.inter(
                            color: const Color(0xFFB1B3A6),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 30.h,
                          alignment: Alignment.centerLeft,
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Container(
                                width: 180.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    width: 0.5,
                                    color: Colors.black,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                  ),
                                ),
                              ),
                              Container(
                                width: (180 * 0.6).w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  color: 0.6 >= 0.20
                                      ? AppColors.greenColor
                                      : AppColors.orangeColor,
                                ),
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 5.w),
                                child: Text(
                                  '${(0.6 * 100).toInt()}%',
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30.h),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greenColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(27).r,
                  side: const BorderSide(width: 3, color: Colors.white),
                ),
                padding: const EdgeInsets.all(10).r,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Continue',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Function to show the profile popup
void showDeathScreeenPopup(BuildContext context, Character character) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black54.withValues(alpha: 0.90),
    builder: (BuildContext context) {
      return DeathScreenPopup(player: character);
    },
  );
}
