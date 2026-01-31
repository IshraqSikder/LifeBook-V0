import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/event_popup_controller.dart';
import '../controllers/sound_service.dart';

class BuildChoiceButton extends StatelessWidget {
  final EventPopupController controller;
  final String choice;
  final String choiceKey;
  const BuildChoiceButton({
    super.key,
    required this.controller,
    required this.choice,
    required this.choiceKey,
  });

  @override
  Widget build(BuildContext context) {
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
          controller.handleChoice(choiceKey); // Call controller method
          Get.find<SoundService>().eventSound();
        },
        child: Text(
          choice,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
