import 'dart:math';
import 'package:get/get.dart';
import 'package:life_book/controllers/home_controller.dart';

import '../models/user.dart';

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
    relationship.agreementRx.value = (relationship.agreementRx.value + change).clamp(0.0, 1.0);
    // Save to Hive database
    controller.player.save();
  }

  int getPartyAndGiftCost() {
    final int currentSalary = controller.player.userInfo.job?.salary ?? 0;
    return 5000 + (currentSalary * 0.05).round();
  }

  void partyLogic(Relationship relationship){
    final int partyCost = getPartyAndGiftCost();

    controller.player.gameStats.balanceRx.value -= partyCost;
    controller.player.gameStats.happinessRx.value = (controller.player.gameStats.happinessRx.value + 10).clamp(0, 100);
    controller.player.gameStats.healthRx.value = (controller.player.gameStats.healthRx.value - 10).clamp(0, 100);
    relationship.agreementRx.value = (relationship.agreementRx.value + 10).clamp(0, 100);

    controller.player.save();
  }

  void giftLogic() {
    final int partyCost = getPartyAndGiftCost();

    controller.player.gameStats.balanceRx.value -= partyCost;
    controller.player.gameStats.happinessRx.value = (controller.player.gameStats.happinessRx.value + 5).clamp(0, 100);

    controller.player.save();
  }
}