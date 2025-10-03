import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/screens/events/events_popup_list.dart';
import 'package:life_book/screens/home/life_story.dart';
import 'package:life_book/theme.dart';

class EventPopup extends StatefulWidget {
  final int rndIndex;
  final List<LifeStory> lifeStories;
  final int age;
  final VoidCallback func;
  const EventPopup(
    this.rndIndex,
    this.lifeStories, {
    super.key,
    required this.age,
    required this.func,
  });

  @override
  State<EventPopup> createState() => _EventPopupState();
}

class _EventPopupState extends State<EventPopup> {
  @override
  Widget build(BuildContext context) {
    var rndEvent = eventsPopupList[widget.rndIndex - 1];
    return Dialog(
      child: Container(
        width: double.infinity,
        height: 400.h,
        constraints: BoxConstraints(maxWidth: 350).w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Color(0xFFE53100), width: 5.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Event header
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 250.w,
                height: 30.h,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 12.h),
                margin: EdgeInsets.symmetric(vertical: 25.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [AppColors.redColor, Colors.white],
                  ),
                ),
                child: Text(
                  'Events',
                  textAlign: TextAlign.end,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            // Event title with icon
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 12.h),
              margin: EdgeInsets.only(right: 3.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SvgPicture.asset(
                  //   "assets/events/car.svg",
                  //   width: 35.w,
                  //   height: 35.h,
                  //   fit: BoxFit.contain,
                  // ),
                  Container(
                    width: 38.w,
                    height: 38.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: SvgPicture.asset("assets/events/car.svg"),
                  ),
                  // SvgPicture.asset("assets/icons/logo.svg"),
                  SizedBox(width: 10.w),
                  Text(
                    rndEvent["title"],
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      color: AppColors.brownColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            // Event content
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                rndEvent["description"],
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: const Color(0xFF3D010B),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 45.h),

            // Choice Buttons
            _buildChoiceButton(rndEvent["choices"][0]),
            SizedBox(height: 10.h),
            _buildChoiceButton(rndEvent["choices"][1]),
          ],
        ),
      ),
    );
  }

  Widget _buildChoiceButton(dynamic choice) {
    return Container(
      width: 250.w,
      height: 40.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w),

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF007ACF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
          elevation: 3,
          shadowColor: const Color(0xFFBAB9B7),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        ),
        onPressed: () {
          // Add your onPressed logic here
          setState(() {
            widget.lifeStories.add(
              LifeStory(
                description: "You're now ${widget.age} years old!",
                age: widget.age,
                flavor: choice["flavor"],
              ),
            );
          });

          widget.func();
          Navigator.pop(context);
        },
        child: Text(
          choice["option"],
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// Function to show the profile popup
void showEventPopup(
  BuildContext context,
  List<LifeStory> lifeStories,
  int age,
  VoidCallback func,
) {
  final random = math.Random();
  int rndnumber =
      random.nextInt(eventsPopupList.length) + 1; // 1 to size of EventPopupList
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black54.withValues(alpha: 0.90),
    builder: (BuildContext context) {
      return EventPopup(rndnumber, lifeStories, age: age, func: func);
    },
  );
}
