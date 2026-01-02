import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:life_book/views/home/profile_header.dart';
import 'package:life_book/theme.dart';
import 'package:life_book/views/relationships/relation_profile_popup.dart';

import '../../controllers/custom_animation_controller.dart';
import '../../models/user.dart';
import '../../shared/cost_stat_message_popup.dart';
import '../../shared/message_popup.dart';
import '../../shared/stat_message_popup.dart';

class RelationDetailScreen extends StatelessWidget {
  final Relationship relationship;

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
                  relationship.relation.toUpperCase(),
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
              topToCenterAnimationPopup(RelationProfilePopup(relationship: relationship), false);
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                          width:
                                              (130 * relationship.agreement).w,
                                          decoration: BoxDecoration(
                                            color:
                                                relationship.agreement >= 0.20
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
                            "assets/images/menu/three-dot.svg",
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
              'Activities',
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
            onTap: StatMassagePopup(
              title: "Let's talk",
              description:
                  "You and your mother had a conversation about which animal you would like to be.",
              statTitle: "Agreement",
              statValue: 0.6,
            ),
          ),
          RelationshipActivityCard(
            title: 'Spend Time',
            subtitle: 'Spend time with her',
            imageUrl: 'assets/images/relationships/spend-time.png',
            onTap: MessagePopup(
              title: "Time well spent",
              message: "You took your mother to the park",
            ),
          ),
          if (relationship.type == 'Spouses') ...[
            RelationshipActivityCard(
              title: 'Make Love',
              subtitle: 'Make love to her',
              imageUrl: 'assets/images/relationships/make-love.png',
              onTap: StatMassagePopup(
                title: "Make Love",
                description: "You and your wife, Max, made love.",
                statTitle: "Enjoyment",
                statValue: 0.8,
              ),
            ),
            RelationshipActivityCard(
              title: 'Gift',
              subtitle: 'Give her a gift',
              imageUrl: 'assets/images/relationships/gift-box.png',
              onTap: CostStatMessagePopup(
                title: "Gift",
                description:
                    "You’ve presented a beautiful ring to your wife, Max. It’s a moment that neither of you will ever forget.",
                cost: 1350,
                effectStatKey: "Happiness",
                currentStatPercentage: 0.30,
              ),
            ),
            RelationshipActivityCard(
              title: 'Divorce',
              subtitle: 'Apply for divorce',
              imageUrl: 'assets/images/relationships/broken-heart.png',
              onTap: MessagePopup(
                title: "Divorce",
                message: "You divorced your wife",
                negative: true,
              ),
            ),
          ] else if (relationship.type == 'Ex-Spouses') ...[
            RelationshipActivityCard(
              title: 'Make Love',
              subtitle: 'Make love to her',
              imageUrl: 'assets/images/relationships/make-love.png',
              onTap: StatMassagePopup(
                title: "Make Love",
                description: "You and your wife, Max, made love.",
                statTitle: "Enjoyment",
                statValue: 0.8,
              ),
            ),
            RelationshipActivityCard(
              title: 'Gift',
              subtitle: 'Give her a gift',
              imageUrl: 'assets/images/relationships/gift-box.png',
              onTap: CostStatMessagePopup(
                title: "Gift",
                description:
                    "You’ve presented a beautiful ring to your wife, Max. It’s a moment that neither of you will ever forget.",
                cost: 1350,
                effectStatKey: "Happiness",
                currentStatPercentage: 0.30,
              ),
            ),
            RelationshipActivityCard(
              title: 'Call',
              subtitle: 'Call her up',
              imageUrl: 'assets/images/relationships/telephone.png',
              onTap: MessagePopup(
                title: "Call",
                message: "You called your ex wife",
              ),
            ),
          ] else if (relationship.type == 'Lovers') ...[
            RelationshipActivityCard(
              title: 'Make Love',
              subtitle: 'Make love to her',
              imageUrl: 'assets/images/relationships/make-love.png',
              onTap: StatMassagePopup(
                title: "Make Love",
                description: "You and your wife, Max, made love.",
                statTitle: "Enjoyment",
                statValue: 0.8,
              ),
            ),
            RelationshipActivityCard(
              title: 'Gift',
              subtitle: 'Give her a gift',
              imageUrl: 'assets/images/relationships/gift-box.png',
              onTap: CostStatMessagePopup(
                title: "Gift",
                description:
                    "You’ve presented a beautiful ring to your wife, Max. It’s a moment that neither of you will ever forget.",
                cost: 1350,
                effectStatKey: "Happiness",
                currentStatPercentage: 0.30,
              ),
            ),
            RelationshipActivityCard(
              title: 'Propose',
              subtitle: 'Propose her',
              imageUrl: 'assets/images/relationships/ring.png',
              onTap: MessagePopup(
                title: "Propose",
                message: "You proposed her and she agreed",
              ),
            ),
            RelationshipActivityCard(
              title: 'Breakup',
              subtitle: 'Breakup with her',
              imageUrl: 'assets/images/relationships/breakup.png',
              onTap: MessagePopup(
                title: "Breakup",
                message: "You broke up with her",
                negative: true,
              ),
            ),
          ] else if (relationship.type == 'Friends') ...[
            RelationshipActivityCard(
              title: 'Party',
              subtitle: 'Party with him',
              imageUrl: 'assets/images/relationships/liquor.png',
              onTap: MessagePopup(title: "Party", message: "Party with him"),
            ),
            RelationshipActivityCard(
              title: 'Gift',
              subtitle: 'Give her a gift',
              imageUrl: 'assets/images/relationships/gift-box.png',
              onTap: CostStatMessagePopup(
                title: "Gift",
                description:
                    "You’ve presented a beautiful ring to your wife, Max. It’s a moment that neither of you will ever forget.",
                cost: 1350,
                effectStatKey: "Happiness",
                currentStatPercentage: 0.30,
              ),
            ),
            RelationshipActivityCard(
              title: 'Sleepover',
              subtitle: 'Have a sleepover with him',
              imageUrl: 'assets/images/relationships/sleepover-party.png',
              onTap: MessagePopup(
                title: "Sleepover",
                message: "You and Dustin had a sleepover",
              ),
            ),
            RelationshipActivityCard(
              title: 'Make Lover',
              subtitle: 'Be my lover',
              imageUrl: 'assets/images/relationships/breakup.png',
              onTap: MessagePopup(
                title: "Make Lover",
                message: "You and Dustin can not be lover",
                negative: true,
              ),
            ),
            RelationshipActivityCard(
              title: 'Unfriend',
              subtitle: 'Unfriend him',
              imageUrl: 'assets/images/relationships/unfriend.png',
              onTap: MessagePopup(
                title: "Unfriend",
                message: "You ended your friendship with Dustin",
                negative: true,
              ),
            ),
          ],
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
                      "assets/images/menu/three-dot.svg",
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
