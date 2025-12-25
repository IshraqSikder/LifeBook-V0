import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme.dart';

class MessagePopup extends StatelessWidget {
  final String title;
  final String message;
  final bool negative;
  const MessagePopup({
    super.key,
    required this.title,
    required this.message,
    this.negative = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 25.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 5.w,
            color: negative == false ? Color(0xFF007DD1) : Color(0xFFF44336),
          ),
          borderRadius: BorderRadius.circular(16).r,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              // Conversation Title
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: negative == false
                      ? Color(0xFF176FD1)
                      : AppColors.redColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
