import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_book/models/event_popup_list.dart';
import 'package:life_book/views/event/event_choice_popup_new.dart';
import 'package:life_book/models/event_choice_list.dart';
import 'package:life_book/controllers/home_controller.dart';
import 'package:life_book/screens/home/life_story.dart';
import 'package:life_book/views/event/event_popup.dart';

class EventPopupController extends GetxController {
  final int age;
  late int rndChoiceIndex, rndPopupIndex;
  late RxMap<String, dynamic> rndChoiceEvent, rndPopupEvent;

  EventPopupController({required this.age});

  final HomeController homeController = Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();
    _initializeEvent();
  }

  void _initializeEvent() {
    final random = math.Random();
    rndChoiceIndex = random.nextInt(
      eventsChoiceList.length,
    ); // 0-indexed event choice list
    rndChoiceEvent = eventsChoiceList[rndChoiceIndex].obs;
    rndPopupIndex = random.nextInt(
      eventsPopupList.length,
    ); // 0-indexed event popup list
    rndPopupEvent = eventsPopupList[rndPopupIndex].obs;
  }

  void handleChoice(Map<String, dynamic> choice) {
    // 1. Apply stat changes to the player character
    if (choice.containsKey("result") &&
        choice["result"] is Map<String, dynamic>) {
      homeController.applyStatChanges(choice["result"]);
    }

    // 2. Add a new LifeStory entry based on the choice flavor
    homeController.addLifeStoryEntry(
      LifeStory(
        description: "You're now $age years old!",
        age: age,
        flavor: choice["flavor"],
      ),
    );
    // 3. After handling the choice, dismiss the dialog
    Get.back();
  }
}

// Function to show the EventPopup using Get.dialog
void showEventPopupGetX(int age) {
  final random = math.Random();
  int number = random.nextInt(100) + 1; // 1 to 100
  Get.put(EventPopupController(age: age));
  if (number <= 40) // 40% of chances
  {
    Get.dialog(
      EventChoicePopupNew(),
      barrierDismissible: false,
      barrierColor: Colors.black54.withValues(alpha: 0.90),
    ).then((value) {
      Get.delete<EventPopupController>(); // Clean up the controller
    });
  } else if (number > 40 && number <= 80) // 40% of chances
  {
    Get.dialog(
      EventPopupNew(),
      barrierDismissible: true,
      barrierColor: Colors.black54.withValues(alpha: 0.90),
    ).then((value) {
      final HomeController homeController = Get.find<HomeController>();
      final EventPopupController eventController =
          Get.find<EventPopupController>();

      homeController.applyStatChanges(eventController.rndPopupEvent["result"]);

      homeController.addLifeStoryEntry(
        LifeStory(
          description: "You're now $age years old!",
          age: age,
          flavor: eventController.rndPopupEvent["flavor"],
        ),
      );
      Get.delete<EventPopupController>(); // Clean up the controller
    });
  }
}
