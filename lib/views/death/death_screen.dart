import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:life_book/controllers/death_controller.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/theme.dart';

class DeathScreen extends StatelessWidget {
  final User player;

  const DeathScreen({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    final DeathScreenController controller = Get.put(
      DeathScreenController(),
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 70.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
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
                    // player.name,
                    player.userInfo.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFDADBD3),
                      fontSize: 28.sp,
                      fontFamily: 'Jaro',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    'AGED ${player.gameStats.levelsRx.last.age} YEARS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFDADBD3),
                      fontSize: 24.sp,
                      fontFamily: 'Jaro',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Net Worth: ',
                          style: TextStyle(
                            color: const Color(0xFFDBDBD3),
                            fontFamily: 'Inter',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text:
                              '\$252,538\n', // This should probably come from player.netWorth
                          style: TextStyle(
                            color: const Color(0xFFDBDBD3),
                            fontFamily: 'Inter',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Residence: ',
                          style: TextStyle(
                            color: const Color(0xFFDBDBD3),
                            fontFamily: 'Inter',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text:
                              'Salt Lake City, United States\n', // From player.residence
                          style: TextStyle(
                            color: const Color(0xFFDBDBD3),
                            fontFamily: 'Inter',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Career: ',
                          style: TextStyle(
                            color: const Color(0xFFDBDBD3),
                            fontFamily: 'Inter',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'Animator\n', // From player.career
                          style: TextStyle(
                            color: const Color(0xFFDBDBD3),
                            fontFamily: 'Inter',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Education: ',
                          style: TextStyle(
                            color: const Color(0xFFDBDBD3),
                            fontFamily: 'Inter',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'University', // From player.education
                          style: TextStyle(
                            color: const Color(0xFFDBDBD3),
                            fontFamily: 'Inter',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'My whole life felt like it was defined by my name. Slaughter. On the football field, that’s who I was. From a kid in Colorado to a champion at Alabama and then a superstar for the Chicago Bears, my life was a highlight reel of hard hits and roaring crowds.', // From player.deathNarrative or similar
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFB1B3A6),
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
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
                          style: TextStyle(
                            color: const Color(0xFFB1B3A6),
                            fontFamily: 'Inter',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none,
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
                                width: (180 * 0.6)
                                    .w, // This 0.6 should be player.agreementPercentage
                                height: 20.h,
                                decoration: BoxDecoration(
                                  color: 0.6 >= 0.20
                                      ? AppColors.greenColor
                                      : AppColors.orangeColor,
                                ),
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 5.w),
                                child: Text(
                                  '${(0.6 * 100).toInt()}%', // Display player.agreementPercentage
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Inter',
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
                controller.endGame(); // Call the controller's method
              },
              child: Text(
                'Continue',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
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
