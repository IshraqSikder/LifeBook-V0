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
import '../../shared/button_message_popup.dart';
import '../../shared/cost_stat_message_popup.dart';
import '../../shared/message_popup.dart';
import '../../shared/relationship_activity_card.dart';
import '../../shared/stat_message_popup.dart';

class RelationDetailScreen extends StatelessWidget {
  final Relationship relationship;

  const RelationDetailScreen({super.key, required this.relationship});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    final RelationshipController relationshipController = Get.put(
      RelationshipController(),
    );
    final bool isMale = relationship.gender == 'Male';
    final bool hasSpouse = homeController.player.userInfo.relationships.any((r) => r.type == 'Spouses');

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
                                                        (relationship
                                                                .agreementRx
                                                                .value)
                                                            .clamp(0.0, 1.0))
                                                    .w,
                                            decoration: BoxDecoration(
                                              color:
                                                  (relationship
                                                              .agreementRx
                                                              .value)
                                                          .clamp(0.0, 1.0) >=
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
          RelationshipActivityCard(
            title: 'Conversation',
            subtitle: 'Have a conversation with ${isMale ? 'him' : 'her'}',
            imageUrl: 'assets/images/relationships/conversation.png',
            onTap: StatMassagePopup(
              title: "Let's talk",
              description:
                  "You and your ${relationship.relation} had a conversation about which animal you would like to be.",
              statTitle: "Agreement",
              statValue: relationship.agreementRx,
            ),
            relationship: relationship,
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
                statValue: 0.8.obs,
              ),
              relationship: relationship,
            ),
            Obx(() {
              final int netBalance =
                  homeController.player.gameStats.balanceRx.value;
              final int currentSalary =
                  homeController.player.userInfo.job?.salary ?? 0;
              final int totalCost = (5000 + (currentSalary * 0.10)).round();
              final bool isAffordable = netBalance >= totalCost;

              return RelationshipActivityCard(
                title: 'Gift',
                subtitle:
                    'A gift will cost \$${relationshipController.getPartyAndGiftCost()}',
                imageUrl: 'assets/images/relationships/gift-box.png',
                onTap: CostStatMessagePopup(
                  title: "Gift",
                  description:
                      "You’ve presented a beautiful ring to your ${relationship.relation}, ${relationship.name}. It’s a moment that neither of you will ever forget.",
                  cost: relationshipController.getPartyAndGiftCost(),
                  effectStatKey: "Agreement",
                  currentStatPercentage: relationship.agreementRx.value,
                ),
                relationship: relationship,
                isAffordable: isAffordable,
              );
            }),
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
                statValue: 0.8.obs,
              ),
              relationship: relationship,
            ),
            Obx(() {
              final int netBalance =
                  homeController.player.gameStats.balanceRx.value;
              final int currentSalary =
                  homeController.player.userInfo.job?.salary ?? 0;
              final int totalCost = (5000 + (currentSalary * 0.10)).round();
              final bool isAffordable = netBalance >= totalCost;

              return RelationshipActivityCard(
                title: 'Gift',
                subtitle:
                    'A gift will cost \$${relationshipController.getPartyAndGiftCost()}',
                imageUrl: 'assets/images/relationships/gift-box.png',
                onTap: CostStatMessagePopup(
                  title: "Gift",
                  description:
                      "You’ve presented a beautiful ring to your ${relationship.relation}, ${relationship.name}. It’s a moment that neither of you will ever forget.",
                  cost: relationshipController.getPartyAndGiftCost(),
                  effectStatKey: "Agreement",
                  currentStatPercentage: relationship.agreementRx.value,
                ),
                relationship: relationship,
                isAffordable: isAffordable,
              );
            }),
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
                statValue: 0.8.obs,
              ),
              relationship: relationship,
            ),
            Obx(() {
              final int netBalance =
                  homeController.player.gameStats.balanceRx.value;
              final int currentSalary =
                  homeController.player.userInfo.job?.salary ?? 0;
              final int totalCost = (5000 + (currentSalary * 0.10)).round();
              final bool isAffordable = netBalance >= totalCost;

              return RelationshipActivityCard(
                title: 'Gift',
                subtitle:
                    'A gift will cost \$${relationshipController.getPartyAndGiftCost()}',
                imageUrl: 'assets/images/relationships/gift-box.png',
                onTap: CostStatMessagePopup(
                  title: "Gift",
                  description:
                      "You’ve presented a beautiful ring to your ${relationship.relation}, ${relationship.name}. It’s a moment that neither of you will ever forget.",
                  cost: relationshipController.getPartyAndGiftCost(),
                  effectStatKey: "Agreement",
                  currentStatPercentage: relationship.agreementRx.value,
                ),
                relationship: relationship,
                isAffordable: isAffordable,
              );
            }),
            // Obx(() {
            //
            // }),
            RelationshipActivityCard(
              title: 'Propose',
              subtitle: 'Propose to ${isMale ? 'him' : 'her'}',
              imageUrl: 'assets/images/relationships/ring.png',
              relationship: relationship,
              onTap: hasSpouse
                  ? MessagePopup(
                      title: "Already Married",
                      message:
                          "Sorry, you already have a ${relationship.gender == 'Male' ? 'husband' : 'wife'}.",
                      negative: true,
                    )
                  : ButtonMessagePopup(
                      title: "Propose",
                      message:
                          "Are you sure you want to propose to ${isMale ? 'him' : 'her'}?",
                      func: () {
                        relationshipController.proposeLogic(relationship);
                      },
                    ),
            ),
            RelationshipActivityCard(
              title: 'Breakup',
              subtitle: 'Breakup with ${isMale ? 'him' : 'her'}',
              imageUrl: 'assets/images/relationships/breakup.png',
              onTap: ButtonMessagePopup(
                title: "Breakup",
                message:
                    "Are you sure you want to breakup with ${relationship.name}?",
                func: () => relationshipController.breakupLogic(relationship),
              ),
              relationship: relationship,
            ),
          ] else if (relationship.type == 'Friends') ...[
            Obx(() {
              final int netBalance =
                  homeController.player.gameStats.balanceRx.value;
              final int currentSalary =
                  homeController.player.userInfo.job?.salary ?? 0;
              final int totalCost = (5000 + (currentSalary * 0.10)).round();

              final bool isAffordable = netBalance >= totalCost;

              return RelationshipActivityCard(
                title: 'Party',
                subtitle:
                    'Throwing a party will cost \$${relationshipController.getPartyAndGiftCost()}',
                imageUrl: 'assets/images/relationships/liquor.png',
                onTap: CostStatMessagePopup(
                  title: "Party",
                  description: 'You did party with ${relationship.name}',
                  cost: relationshipController.getPartyAndGiftCost(),
                  effectStatKey: 'Agreement',
                  currentStatPercentage: relationship.agreementRx.value,
                ),
                relationship: relationship,
                isAffordable: isAffordable,
              );
            }),
            Obx(() {
              final int netBalance =
                  homeController.player.gameStats.balanceRx.value;
              final int currentSalary =
                  homeController.player.userInfo.job?.salary ?? 0;
              final int totalCost = (5000 + (currentSalary * 0.10)).round();
              final bool isAffordable = netBalance >= totalCost;

              return RelationshipActivityCard(
                title: 'Gift',
                subtitle:
                    'A gift will cost \$${relationshipController.getPartyAndGiftCost()}',
                imageUrl: 'assets/images/relationships/gift-box.png',
                onTap: CostStatMessagePopup(
                  title: "Gift",
                  description:
                      "You’ve presented a beautiful ring to your ${relationship.relation}, ${relationship.name}. It’s a moment that neither of you will ever forget.",
                  cost: relationshipController.getPartyAndGiftCost(),
                  effectStatKey: "Agreement",
                  currentStatPercentage: relationship.agreementRx.value,
                ),
                relationship: relationship,
                isAffordable: isAffordable,
              );
            }),
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
            if (relationship.gender != homeController.player.userInfo.gender)
              Obx(() {
                final bool canBeLover =
                    relationship.age >= 15 &&
                    homeController.player.gameStats.levelsRx.last.ageRx.value >=
                        15 &&
                    relationship.agreementRx.value > 0.6;
                return RelationshipActivityCard(
                  title: 'Make Lover',
                  subtitle: 'Be my lover',
                  imageUrl: 'assets/images/relationships/breakup.png',
                  onTap: !canBeLover
                      ? MessagePopup(
                          title: 'Warning',
                          message:
                              'Sorry, you are unable to be ${isMale ? 'him' : 'her'} lover yet. Make more conversation or spend more time with ${isMale ? 'him' : 'her'}',
                          negative: true,
                        )
                      : ButtonMessagePopup(
                          title: "Make Lover",
                          message:
                              "Are you sure you want to make ${isMale ? 'him' : 'her'} your lover?",
                          func: () => relationshipController.makeLoverLogic(
                            relationship,
                          ),
                        ),
                  relationship: relationship,
                  // isAffordable: canBeLover,
                );
              }),
            RelationshipActivityCard(
              title: 'Unfriend',
              subtitle: 'Unfriend ${isMale ? 'him' : 'her'}',
              imageUrl: 'assets/images/relationships/unfriend.png',
              onTap: ButtonMessagePopup(
                title: "Unfriend",
                message:
                    "Are you sure you want to end friendship with ${relationship.name}?",
                func: () => relationshipController.unfriendLogic(relationship),
              ),
              relationship: relationship,
            ),
          ],
        ],
      ),
    );
  }
}
