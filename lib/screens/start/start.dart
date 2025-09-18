import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/models/character.dart';
import 'package:life_book/screens/appbar/appbar.dart';
import 'package:life_book/screens/home/home.dart';
import 'package:life_book/screens/start/create.dart';
import 'package:life_book/screens/start/tutorial.dart';
import 'package:life_book/theme.dart';

class StartScreen extends StatelessWidget {
  // final Character player;
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 120.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 105.h,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 78.h,
                      color: Colors.black,
                    ),
                    Positioned(
                      top: -15.h,
                      left: 50.w,
                      right: 50.w,
                      child: Center(child: _buildNLB(context)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildNLB(context) {
  return GestureDetector(
    onTap: () {
      // showCreateCharacterScreen(context);
      showCreateCharacterScreen(context, (Character newPlayer) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home(player: newPlayer)),
        );
      });
    },
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
            Container(
              width: 38.w,
              height: 38.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: SvgPicture.asset("assets/icons/sperm.svg"),
            ),
            Text(
              'New Life',
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
  );
}
