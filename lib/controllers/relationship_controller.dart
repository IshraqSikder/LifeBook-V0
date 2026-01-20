import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_book/controllers/home_controller.dart';

import '../models/user.dart';
import '../shared/message_popup.dart';
import '../views/home/home_screen.dart';

class RelationshipController extends GetxController {
  final HomeController controller = Get.find<HomeController>();

  void processRelationStatBarLogic(Relationship relationship) {
    final random = Random().nextInt(100) + 1;
    double change = 0.0;

    if (relationship.agreementRx.value > 0.4) {
      // Table 1
      if (random <= 60) {
        change = 0.05;
      } else if (random <= 80) {
        change = 0.0;
      } else {
        change = -0.02;
      }
    } else {
      // Table 2
      if (random <= 75) {
        change = 0.05;
      } else if (random <= 85) {
        change = 0.0;
      } else {
        change = -0.02;
      }
    }
    relationship.agreementRx.value = (relationship.agreementRx.value + change)
        .clamp(0.0, 1.0);

    controller.player.save();
  }

  int getPartyAndGiftCost() {
    final int currentSalary = controller.player.userInfo.job?.salary ?? 0;
    return 5000 + (currentSalary * 0.05).round();
  }

  void partyLogic(Relationship relationship) {
    final int partyCost = getPartyAndGiftCost();

    controller.player.gameStats.balanceRx.value -= partyCost;
    controller.player.gameStats.happinessRx.value =
        (controller.player.gameStats.happinessRx.value + 10).clamp(0, 100);
    controller.player.gameStats.healthRx.value =
        (controller.player.gameStats.healthRx.value - 10).clamp(0, 100);
    relationship.agreementRx.value = (relationship.agreementRx.value + 0.1)
        .clamp(0, 100);

    controller.player.save();
  }

  void giftLogic() {
    final int partyCost = getPartyAndGiftCost();

    controller.player.gameStats.balanceRx.value -= partyCost;
    controller.player.gameStats.happinessRx.value =
        (controller.player.gameStats.happinessRx.value + 5).clamp(0, 100);

    controller.player.save();
  }

  void makeLoverLogic(Relationship relationship) async {
    // Calculate count of existing lovers and spouses
    int competitionCount = controller.player.userInfo.relationships
        .where((rel) => rel.type == 'Lovers' || rel.type == 'Spouses')
        .length;

    double currentStat = relationship.agreementRx.value * 100;
    double successPercentage = currentStat - (10 * (competitionCount + 1));

    // Minimum 20% success rate check
    if (successPercentage < 20) {
      successPercentage = 20;
    }

    int roll = Random().nextInt(100) + 1;
    bool isAccepted = roll <= successPercentage;

    if (isAccepted) {
      controller.player.gameStats.happinessRx.value =
          (controller.player.gameStats.happinessRx.value + 10).clamp(0, 100);
      relationship.agreementRx.value = (relationship.agreementRx.value + 0.10)
          .clamp(0.0, 1.0);

      relationship.type = 'Lovers';
      relationship.relation = 'Lover';

      await _showResultDialog(
        "Accepted",
        "You and ${relationship.name} are now lovers!",
      );
    } else {
      controller.player.gameStats.happinessRx.value =
          (controller.player.gameStats.happinessRx.value - 10).clamp(0, 100);
      relationship.agreementRx.value = (relationship.agreementRx.value - 0.10)
          .clamp(0.0, 1.0);

      await _showResultDialog(
        "Rejected",
        "${relationship.name} rejected your proposal.",
        isNegative: true,
      );
    }
    controller.player.save();
    Get.offAll(() => HomeScreen(player: controller.player));
  }

  void unfriendLogic(relationship) async {
    controller.player.userInfo.relationships.remove(relationship);

    await controller.player.save();
    if (Get.isDialogOpen ?? false) Get.back();

    await _showResultDialog(
      "Unfriend",
      "You ended your friendship with ${relationship.name}",
      isNegative: true,
    );

    Get.offAll(() => HomeScreen(player: controller.player));
  }

  void breakupLogic(relationship) async {
    controller.player.userInfo.relationships.remove(relationship);

    await controller.player.save();
    if (Get.isDialogOpen ?? false) Get.back();

    await _showResultDialog(
      "Breakup",
      "You broke up with ${relationship.name}",
      isNegative: true,
    );

    Get.offAll(() => HomeScreen(player: controller.player));
  }

  void divorceLogic(Relationship relationship) async {
    for (var rel in controller.player.userInfo.relationships) {
      if (rel.type == 'Children') {
        rel.agreementRx.value = (rel.agreementRx.value - 0.20).clamp(0.0, 1.0);
      }
    }

    relationship.agreementRx.value = 0.0;

    relationship.type = 'Ex-Spouses';
    relationship.relation = relationship.gender == 'Male'
        ? 'Ex-Husband'
        : 'Ex-Wife';

    await controller.player.save();

    if (Get.isDialogOpen ?? false) Get.back();

    await _showResultDialog(
      "Divorce",
      "You divorced your ${relationship.gender == 'Male' ? 'husband' : 'wife'}. ${relationship.relation.contains('Children') ? 'Your children are upset by the news.' : ''} ",
      isNegative: true,
    );

    Get.offAll(() => HomeScreen(player: controller.player));
  }

  Future<void> proposeLogic(Relationship relationship) async {
    if (Get.isDialogOpen ?? false) Get.back();

    final int cost = getPartyAndGiftCost();

    if (controller.player.gameStats.balanceRx.value < cost) {
      await _showResultDialog(
        "Not Enough Money",
        "You can't afford a ring right now! The ring will cost \$$cost",
        isNegative: true,
      );
    }

    controller.player.gameStats.balanceRx.value -= cost;

    final double randomValue = Random().nextDouble();
    final bool isAccepted = randomValue <= relationship.agreementRx.value;

    if (isAccepted) {
      controller.player.gameStats.happinessRx.value =
          (controller.player.gameStats.happinessRx.value + 10).clamp(0, 100);
      relationship.agreementRx.value = (relationship.agreementRx.value + 0.10)
          .clamp(0.0, 1.0);

      relationship.type = 'Spouses';
      relationship.relation = relationship.gender == 'Male'
          ? 'Husband'
          : 'Wife';

      await _showResultDialog(
        "Propose",
        "You proposed ${relationship.name} and ${relationship.gender == 'Male' ? 'he' : 'she'} agreed",
      );
    } else {
      controller.player.gameStats.happinessRx.value =
          (controller.player.gameStats.happinessRx.value - 10).clamp(0, 100);
      relationship.agreementRx.value = (relationship.agreementRx.value - 0.10)
          .clamp(0.0, 1.0);

      await _showResultDialog(
        "Propose",
        "You proposed ${relationship.name} and got rejected",
        isNegative: true,
      );
    }
    controller.player.save();
    Get.offAll(() => HomeScreen(player: controller.player));
  }

  void makeLoveLogic(Relationship relationship) async {
    controller.player.gameStats.happinessRx.value =
        (controller.player.gameStats.happinessRx.value + 5).clamp(0, 100);
    controller.player.gameStats.healthRx.value =
        (controller.player.gameStats.healthRx.value + 5).clamp(0, 100);
  }

  Future<void> _showResultDialog(
    String title,
    String message, {
    bool isNegative = false,
  }) async {
    return await Get.dialog(
      MessagePopup(title: title, message: message, negative: isNegative),
      barrierDismissible: true,
      barrierColor: Colors.black54.withValues(alpha: 90),
    );
  }
}
