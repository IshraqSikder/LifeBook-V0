import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/controllers/event_popup_controller.dart';
import 'package:life_book/theme.dart';

import '../../shared/build_choice_button.dart';

class EventChoicePopup extends StatelessWidget {
  const EventChoicePopup({super.key});

  @override
  Widget build(BuildContext context) {
    final EventPopupController controller = Get.find<EventPopupController>();

    return Dialog(
      child: Container(
        width: double.infinity,
        height: 375.h,
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
                  style: TextStyle(
                    fontFamily: 'Inter',
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
              child: Obx(
                () => Row(
                  // Observe the rndChoiceEvent from controller
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/menu/correct.svg",
                      width: 35.w,
                      height: 35.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      controller.rndChoiceEvent["title"],
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18.sp,
                        color: AppColors.brownColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h),
            // Event content
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Obx(
                () => Text(
                  controller.rndChoiceEvent["description"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: const Color(0xFF3D010B),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 45.h),

            // Choice Buttons (using Obx for choices as well)
            Obx(
              () => BuildChoiceButton(
                controller: controller,
                choice: '${controller.rndChoiceEvent["choiceAText"]}',
                choiceKey: 'A',
              ),
            ),
            SizedBox(height: 10.h),
            Obx(
              () => BuildChoiceButton(
                controller: controller,
                choice: '${controller.rndChoiceEvent["choiceBText"]}',
                choiceKey: 'B',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
