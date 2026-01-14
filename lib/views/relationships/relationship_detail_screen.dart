import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:life_book/controllers/home_controller.dart';
import 'package:life_book/controllers/relationship_controller.dart';
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
    final HomeController homeController = Get.find<HomeController>();
    final RelationshipController relationshipController = Get.put(RelationshipController(),);
    final bool isMale = relationship.gender == 'Male';

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
          Obx(() {
            return GestureDetector(
              onTap: () {
                topToCenterAnimationPopup(
                  RelationProfilePopup(relationship: relationship),
                  false,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                (130 *
                                                        relationship
                                                            .agreementRx
                                                            .value)
                                                    .w,
                                            decoration: BoxDecoration(
                                              color:
                                                  relationship
                                                          .agreementRx
                                                          .value >=
                                                      0.20
                                                  ? AppColors.greenColor
                                                  : AppColors.orangeColor,
                                            ),
                                            alignment: Alignment.centerRight,
                                            padding: EdgeInsets.only(
                                              right: 5.w,
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
          }),
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
          Obx(
            () => RelationshipActivityCard(
              title: 'Conversation',
              subtitle: 'Have a conversation with ${isMale ? 'him' : 'her'}',
              imageUrl: 'assets/images/relationships/conversation.png',
              onTap: StatMassagePopup(
                title: "Let's talk",
                description:
                    "You and your ${relationship.relation} had a conversation about which animal you would like to be.",
                statTitle: "Agreement",
                statValue: relationship.agreementRx.value,
              ),
              relationship: relationship,
            ),
          ),
          RelationshipActivityCard(
            title: 'Spend Time',
            subtitle: 'Spend time with ${isMale ? 'him' : 'her'}',
            imageUrl: 'assets/images/relationships/spend-time.png',
            onTap: MessagePopup(
              title: "Time well spent",
              message: "You took your ${relationship.relation} to the park",
            ),
            relationship: relationship,
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
              relationship: relationship,
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
              relationship: relationship,
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
              relationship: relationship,
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
              relationship: relationship,
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
              relationship: relationship,
            ),
            RelationshipActivityCard(
              title: 'Call',
              subtitle: 'Call her up',
              imageUrl: 'assets/images/relationships/telephone.png',
              onTap: MessagePopup(
                title: "Call",
                message: "You called your ex wife",
              ),
              relationship: relationship,
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
              relationship: relationship,
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
              relationship: relationship,
            ),
            RelationshipActivityCard(
              title: 'Propose',
              subtitle: 'Propose her',
              imageUrl: 'assets/images/relationships/ring.png',
              onTap: MessagePopup(
                title: "Propose",
                message: "You proposed her and she agreed",
              ),
              relationship: relationship,
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
              relationship: relationship,
            ),
          ] else if (relationship.type == 'Friends') ...[
            Obx(() {
              final int netBalance = homeController.player.gameStats.balanceRx.value;
              final int currentSalary = homeController.player.userInfo.job?.salary ?? 0;
              final int totalCost = (5000 + (currentSalary * 0.10)).round();

              final bool isAffordable = netBalance >= totalCost;

              return RelationshipActivityCard(
                title: 'Party',
                subtitle: 'Party with him',
                imageUrl: 'assets/images/relationships/liquor.png',
                onTap: CostStatMessagePopup(
                  title: "Party",
                  description: 'You did party with ${relationship.name}',
                  cost: relationshipController.getPartyAndGiftCost(),
                  effectStatKey: 'Happiness',
                  currentStatPercentage:
                      homeController.player.gameStats.happinessRx.value / 100,
                ),
                relationship: relationship,
                isAffordable: isAffordable,
              );
            },
            ),
            Obx(() {
                final int netBalance = homeController.player.gameStats.balanceRx.value;
                final int currentSalary = homeController.player.userInfo.job?.salary ?? 0;
                final int totalCost = (5000 + (currentSalary * 0.10)).round();

                final bool isAffordable = netBalance >= totalCost;

                return RelationshipActivityCard(
                title: 'Gift',
                subtitle: 'Give her a gift',
                imageUrl: 'assets/images/relationships/gift-box.png',
                onTap: CostStatMessagePopup(
                  title: "Gift",
                  description:
                      "You’ve presented a beautiful ring to your wife, Max. It’s a moment that neither of you will ever forget.",
                  cost: relationshipController.getPartyAndGiftCost(),
                  effectStatKey: "Happiness",
                  currentStatPercentage:
                      homeController.player.gameStats.happinessRx.value / 100,
                ),
                relationship: relationship,
                isAffordable: isAffordable,
              );
              },
            ),
            // RelationshipActivityCard(
            //   title: 'Sleepover',
            //   subtitle: 'Have a sleepover with him',
            //   imageUrl: 'assets/images/relationships/sleepover-party.png',
            //   onTap: MessagePopup(
            //     title: "Sleepover",
            //     message: "You and Dustin had a sleepover",
            //   ),
            //   relationship: relationship,
            // ),
            RelationshipActivityCard(
              title: 'Make Lover',
              subtitle: 'Be my lover',
              imageUrl: 'assets/images/relationships/breakup.png',
              onTap: MessagePopup(
                title: "Make Lover",
                message: "You and Dustin can not be lover",
                negative: true,
              ),
              relationship: relationship,
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
              relationship: relationship,
            ),
          ],
        ],
      ),
    );
  }
}

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
        onTap: !canPerformAction? null: () {
                // Agreement Changed according to the percentage
                if (title == 'Conversation' ||
                    title == 'Spend Time' ||
                    title == 'Call') {
                  controller.processRelationStatBarLogic(relationship);
                } else if (title == 'Party') {
                  controller.partyLogic(relationship);
                } else if (title == 'Gift') {
                  controller.giftLogic();
                }

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
                                  color: canPerformAction
                                      ? AppColors.blueColor
                                      : Colors.grey[800],
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              // subtitle
                              Text(
                                subtitle,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: canPerformAction? AppColors.blueColor: Colors.grey[800],
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
                        colorFilter: canPerformAction? null: ColorFilter.mode(Colors.grey[800]!, BlendMode.srcIn),
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
