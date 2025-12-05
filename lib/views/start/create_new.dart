import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/controllers/create_character_controller.dart';
import 'package:life_book/theme.dart';

class CreateCharacterScreenNew extends StatelessWidget {
  const CreateCharacterScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateCharacterController controller = Get.put(
      CreateCharacterController(),
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(32).r,
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.hardLight,
          color: Colors.black.withValues(alpha: 0.8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 120.h, bottom: 50.h),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/world.png',
                        width: 16.w,
                        height: 16.h,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Become someone else in LifeBook',
                        style: TextStyle(
                          color: AppColors.yellowColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Start a new life!',
                    style: TextStyle(
                      color: AppColors.yellowColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Full Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2FFE7),
                    borderRadius: BorderRadius.circular(9.r),
                  ),
                  child: TextField(
                    controller: controller.nameController,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      hintStyle: TextStyle(
                        fontFamily: 'Inter',
                        color: const Color(0xFF716D7C),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 16.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Gender',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                // Use Obx for reactive updates to gender buttons
                Obx(() {
                  final String currentSelectedGender =
                      controller.selectedGender.value;
                  return Row(
                    spacing: 24.w,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => controller.selectGender(
                            'Male',
                          ), // Call controller method
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 16.w),
                            decoration: BoxDecoration(
                              color: currentSelectedGender == 'Male'
                                  ? AppColors.greenColor
                                  : const Color(0xFFE2FFE7),
                              borderRadius: BorderRadius.circular(9.r),
                            ),
                            child: Text(
                              'Male',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: controller.selectedGender.value == 'Male'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => controller.selectGender(
                            'Female',
                          ), // Call controller method
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 16.r),
                            decoration: BoxDecoration(
                              color: currentSelectedGender == 'Female'
                                  ? AppColors.greenColor
                                  : const Color(0xFFE2FFE7),
                              borderRadius: BorderRadius.circular(9.r),
                            ),
                            child: Text(
                              'Female',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    controller.selectedGender.value == 'Female'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
            SizedBox(height: 32.h),
            Divider(color: AppColors.textColor, thickness: 2.5.h),
            SizedBox(height: 32.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () =>
                    controller.startLife(), // Call controller method
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE2FFE7),
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Start life!',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
