import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:life_book/views/activities/activity_popup.dart';
import 'package:life_book/services/CSV_services.dart';
import 'package:life_book/views/home/profile_header.dart';
import 'package:life_book/theme.dart';

import '../../controllers/home_controller.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.profileHeaderColor,
        toolbarHeight: 0.h,
        elevation: 0,
      ),
      body: Obx(() {
        print("ActivityScreen Rebuilding! Balance: ${controller.player.gameStats.balanceRx.value}");

        return Column(
          children: [
            ProfileHeader(),
            Container(
              width: double.infinity,
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(color: AppColors.blueColor),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      'assets/icons/cancel.svg',
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 105.w),
                  Text(
                    'ACTIVITIES',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 21,
              decoration: BoxDecoration(color: AppColors.textColor),
              child: Text(
                'All activities that are available',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: activityList.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = activityList[index];

                  // 1. Get the current net balance
                  final int netBalance = controller.player.gameStats.balanceRx.value;
                  // 2. Calculate Total Cost safely (Price + (Salary * DeductRate))
                  final num basePrice = num.tryParse(item["price"].toString()) ?? 0;
                  final double deductPercent = double.tryParse(item["deductBalance"].toString()) ?? 0.0;
                  final int currentSalary = controller.player.userInfo.job?.salary ?? 0;

                  // This is the total price rounded
                  final int totalCost = (basePrice + (currentSalary * deductPercent)).round();

                  // 3. Check if player can afford it
                  final bool isAffordable = netBalance >= totalCost;

                  return Opacity(
                    opacity: isAffordable ? 1.0 : 0.5,
                    child: GestureDetector(
                      onTap: () => isAffordable
                          ? showActivityPopup(context, item, totalCost)
                          : null,
                      child: Container(
                        width: double.infinity,
                        height: 70.h,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.50.w,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.w,
                                vertical: 10.h,
                              ),
                              child: Row(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    spacing: 5.w,
                                    children: [
                                      // image
                                      SizedBox(
                                        width: 35.w,
                                        height: 35.h,
                                        child: Image.asset(
                                          "assets/images/activities/${item["imageUrl"]}.png",
                                          fit: BoxFit.contain,
                                          color: isAffordable
                                              ? null
                                              : Colors.grey[100],
                                          colorBlendMode: isAffordable
                                              ? null
                                              : BlendMode.saturation,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 4.w,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          spacing: 4.h,
                                          children: [
                                            // title
                                            Text(
                                              item["title"],
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: isAffordable
                                                    ? AppColors.blueColor
                                                    : Colors.grey[800],
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            // subtitle
                                            Text(
                                              '${item["subtitle"]} (\$$totalCost)',
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: isAffordable
                                                    ? AppColors.blueColor
                                                    : Colors.grey[800],
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.36.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  // icon
                                  SizedBox(
                                    width: 35.w,
                                    height: 35.h,
                                    child: SvgPicture.asset(
                                      "assets/images/menu/three-dot.svg",
                                      fit: BoxFit.contain,
                                      colorFilter: isAffordable
                                          ? null
                                          : ColorFilter.mode(
                                              Colors.grey[800]!,
                                              BlendMode.srcIn,
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
