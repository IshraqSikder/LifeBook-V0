import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/relationship_controller.dart';
import '../models/user.dart';
import '../theme.dart';

class RelationshipActivityCard extends StatelessWidget {
  final Relationship relationship;
  final String title, subtitle, imageUrl;
  final Widget onTap;
  final bool? isAffordable;

  const RelationshipActivityCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.onTap,
    required this.relationship,
    this.isAffordable,
  });

  @override
  Widget build(BuildContext context) {
    final RelationshipController controller =
    Get.find<RelationshipController>();
    final bool canPerformAction = isAffordable ?? true;

    return Opacity(
      opacity: canPerformAction ? 1.0 : 0.5,
      child: GestureDetector(
        onTap: canPerformAction
            ? () {
          // Agreement Changed according to the percentage
          if (title == 'Conversation' ||
              title == 'Spend Time' ||
              title == 'Call') {
            controller.relationStatsBarLogic(relationship);
          } else if (title == 'Party') {
            controller.partyLogic(relationship);
          } else if (title == 'Gift') {
            controller.giftLogic(relationship);
          } else if (title == 'Make Love') {
            controller.makeLoveLogic(relationship);
          }

          // Handle icon tap
          Get.dialog(
            barrierDismissible: true,
            barrierColor: Colors.black.withValues(alpha: 0.95),
            onTap,
          );
        }
            : null,
        child: Container(
          width: double.infinity,
          height: 70.h,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 0.50.w, color: Colors.black),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Row(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 5.w,
                      children: [
                        // image
                        SizedBox(
                          width: 35.w,
                          height: 35.h,
                          child: Image.asset(
                            imageUrl,
                            fit: BoxFit.contain,
                            color: canPerformAction ? null : Colors.grey[100],
                            colorBlendMode: canPerformAction
                                ? null
                                : BlendMode.saturation,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 4.h,
                            children: [
                              // title
                              Text(
                                title,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: canPerformAction ? AppColors.blueColor : Colors.grey[800],
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              // subtitle
                              Text(
                                subtitle,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: canPerformAction ? AppColors.blueColor : Colors.grey[800],
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
                        colorFilter: canPerformAction
                            ? null
                            : ColorFilter.mode(Colors.grey[800]!, BlendMode.srcIn),
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
  }
}