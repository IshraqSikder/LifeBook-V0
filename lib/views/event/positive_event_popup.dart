import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/controllers/event_popup_controller.dart';
import 'package:life_book/theme.dart';

class EventPopup extends StatelessWidget {
  const EventPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final EventPopupController controller = Get.find<EventPopupController>();

    return Dialog(
      child: Container(
        width: double.infinity,
        height: 180.h,
        constraints: BoxConstraints(maxWidth: 350).w,
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Color(0xFF007DD1), width: 5.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                controller.rndPopupEvent["title"],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18.sp,
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Obx(
              () => Text(
                controller.rndPopupEvent["description"],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: const Color(0xFF0A386C),
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
}
