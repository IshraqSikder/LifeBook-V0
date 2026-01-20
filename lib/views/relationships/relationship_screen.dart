import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:life_book/controllers/home_controller.dart';
import 'package:life_book/views/home/profile_header.dart';
import 'package:life_book/theme.dart';
import 'package:life_book/views/relationships/relationship_detail_screen.dart';

import '../../models/user.dart';

class RelationshipScreen extends StatelessWidget {
  const RelationshipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    // 1. Group relationships by type
    final Map<String, List<Relationship>> groupedRelationships = {};
    for (var rel in controller.player.userInfo.relationships) {
      if (!groupedRelationships.containsKey(rel.type)) {
        groupedRelationships[rel.type] = [];
      }
      groupedRelationships[rel.type]!.add(rel);
    }

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
                SizedBox(width: 75.w),
                Text(
                  'RELATIONSHIPS',
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // 2. Map the list to widgets
                  ...groupedRelationships.entries.map((entry) {
                    String type = entry.key;
                    List<Relationship> relations = entry.value;
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: AppColors.textColor),
                          child: Text(
                            type,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        ...relations.map((data) => RelationCard(data: data)),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RelationCard extends StatelessWidget {
  final Relationship data;
  const RelationCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          // Handle icon tap
          Get.to(
            () => RelationDetailScreen(relationship: data),
            transition: Transition.rightToLeft,
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
                          child: Image.asset(
                            data.imageUrl,
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
                                    data.name,
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
                                    "(Age ${data.age})",
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
                                      width: (130 * data.agreementRx.value).w,
                                      decoration: BoxDecoration(
                                        color: data.agreementRx.value >= 0.20
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
                      width: 20.w,
                      height: 20.h,
                      child: SvgPicture.asset(
                        "assets/icons/right_button.svg",
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
    });
  }
}
