import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:life_book/controllers/home_controller.dart';
import 'package:life_book/services/csv_services.dart';
import 'package:life_book/theme.dart';

class ActivityPopup extends StatelessWidget {
  final Map<String, dynamic> item;
  final Map<String, int> effects;
  final int totalCost;

  const ActivityPopup({super.key, required this.item, required this.effects, required this.totalCost});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    String effectStatKey = effects.entries.first.key;

    int effectStatValue = controller.allStatsPlayer[effectStatKey]!.value;

    double currentStatPercentage = (effectStatValue) / 100;

    return Dialog(
      child: Container(
        width: 305.w,
        height: 285.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 5.w, color: Color(0xFF007DD1)),
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
              // Activity Title
              child: Text(
                item["title"],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Color(0xFF176FD1),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Text(
                item["description"],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              width: double.infinity,
              height: 24.h,
              decoration: BoxDecoration(color: const Color(0xFFEDECE8)),
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    'Cost: ',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: AppColors.brownColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    '\$$totalCost',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: AppColors.brownColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    effectStatKey,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: AppColors.blueColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Stack(
                    children: [
                      Container(
                        width: 160.w,
                        height: 20.h,
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                      ),
                      Container(
                        width: (160 * currentStatPercentage).w,
                        height: 20.h,
                        decoration: currentStatPercentage >= 0.20
                            ? BoxDecoration(color: AppColors.greenColor)
                            : BoxDecoration(color: AppColors.orangeColor),
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 5.w),
                        child: Text(
                          '${(currentStatPercentage * 100).toInt()}%',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to show the activity popup
Future<dynamic> showActivityPopup(
  BuildContext context,
  Map<String, dynamic> item, int totalCost) {
  final HomeController homeController = Get.find<HomeController>();

  // Decrease current year salary by csv percentage %
  homeController.player.gameStats.balanceRx.value -= totalCost;
  print("Controller Rx Instance: ${identityHashCode(homeController.player.gameStats.balanceRx)}");

  // Apply Stats Changes
  String? effectString = item["effect"];
  Map<String, int> parsedEffects = {};
  if (effectString != null) {
    parsedEffects = parseEffects(effectString);
    homeController.applyStatChanges(parsedEffects);
  }

  homeController.player.save();

  return showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black54.withValues(alpha: 0.95),
    builder: (BuildContext context) {
      return ActivityPopup(item: item, effects: parsedEffects, totalCost: totalCost);
    },
  );
}
