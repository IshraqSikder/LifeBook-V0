import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:life_book/views/home/profile_header.dart';
import 'package:life_book/theme.dart';
import 'package:life_book/views/relationships/conversation_popup.dart';
import 'package:life_book/views/relationships/relation_profile_popup.dart';
import 'package:life_book/views/relationships/relationship_model.dart';
import 'package:life_book/views/relationships/spend_time_popup.dart';

class RelationDetailScreen extends StatelessWidget {
  final RelationshipModel relationship;

  const RelationDetailScreen({super.key, required this.relationship});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.profileHeaderColor,
        toolbarHeight: 0.h,
        elevation: 0,
      ),
      body: Column(
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
                  relationship.type.toUpperCase(),
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
          GestureDetector(
            onTap: () {
              Get.dialog(
                barrierDismissible: true,
                barrierColor: Colors.black.withValues(alpha: 0.95),
                RelationProfilePopup(relationship: relationship,),
              );
            },
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 10.h,
                    ),
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
                                relationship.imageUrl,
                                fit: BoxFit.contain,
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
                                  Wrap(
                                    alignment: WrapAlignment.center,
                                    children: [
                                      Text(
                                        relationship.name,
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: AppColors.blueColor,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(width: 3.w),
                                      // subtitle
                                      Text(
                                        "(Age ${relationship.age})",
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: AppColors.blueColor,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Relationship",
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: AppColors.blueColor,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Container(
                                        width: 130.w,
                                        height: 8.h,
                                        alignment: Alignment.centerLeft,
                                        color: AppColors.profileHeaderColor,
                                        child: Container(
                                          width: (130 * relationship.agreement).w,
                                          decoration: BoxDecoration(
                                            color: relationship.agreement >= 0.20
                                                ? AppColors.greenColor
                                                : AppColors.orangeColor,
                                          ),
                                          alignment: Alignment.centerRight,
                                          padding: EdgeInsets.only(right: 5.w),
                                        ),
                                      ),
                                    ],
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
                            "assets/images/menu/threedot.svg",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
          RelationshipActivityCard(
            title: 'Conversation',
            subtitle: 'Have a conversation with him',
            imageUrl: 'assets/images/relationships/conversation.png',
            onTap: ConversationPopup(),
          ),
          RelationshipActivityCard(
            title: 'Spend Time',
            subtitle: 'Spend time with her',
            imageUrl: 'assets/images/relationships/spend-time.png',
            onTap: SpendTimePopup(),
          ),
        ],
      ),
    );
  }
}

class RelationshipActivityCard extends StatelessWidget {
  final String title, subtitle, imageUrl;
  final Widget onTap;

  const RelationshipActivityCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle icon tap
        Get.dialog(
          barrierDismissible: true,
          barrierColor: Colors.black.withValues(alpha: 0.95),
          onTap,
        );
      },
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
                        child: Image.asset(imageUrl, fit: BoxFit.contain),
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
                                color: AppColors.blueColor,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            // subtitle
                            Text(
                              subtitle,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: AppColors.blueColor,
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
                      "assets/images/menu/threedot.svg",
                      fit: BoxFit.contain,
                    ),
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
