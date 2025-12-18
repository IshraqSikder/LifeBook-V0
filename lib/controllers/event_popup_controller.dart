import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_book/services/CSV_services.dart';
import 'package:life_book/views/event/choice_event_popup.dart';
import 'package:life_book/controllers/home_controller.dart';
import 'package:life_book/views/home/life_story.dart';
import 'package:life_book/views/event/positive_event_popup.dart';

class EventPopupController extends GetxController {
  final int age;
  late int rndChoiceIndex, rndPopupIndex;
  late RxMap<String, dynamic> rndChoiceEvent, rndPopupEvent;

  EventPopupController({required this.age});

  final HomeController homeController = Get.find<HomeController>();

  @override
  void onInit() async {
    super.onInit();
    _initializeEvent();
  }

  void _initializeEvent() {
    final random = math.Random();
    // for choiceEvent
    rndChoiceIndex = random.nextInt(choiceEventList.length);
    rndChoiceEvent = choiceEventList[rndChoiceIndex].obs;

    // for positiveEvent
    rndPopupIndex = random.nextInt(positiveEventList.length);
    rndPopupEvent = positiveEventList[rndPopupIndex].obs;
  }

  void handleChoice(choiceKey) {
    // 1. Apply stat changes to the player character
    String? effectString =
        rndChoiceEvent[choiceKey == 'A' ? 'choiceAEffect' : 'choiceBEffect'];

    if (effectString != null) {
      final effects = parseEffects(effectString);
      homeController.applyStatChanges(effects);
    }

    // 2. Add a new LifeStory entry based on the choice flavor
    String choiceText =
        rndChoiceEvent[choiceKey == 'A' ? 'choiceAText' : 'choiceBText'] ?? "";

    // 3. Save it to the persistent user level
    homeController.addEventToCurrentAge(choiceText);

    // 4. After handling the choice, dismiss the dialog
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
    Get.generalDialog(
      barrierDismissible: false,
      barrierColor: Colors.black54.withValues(alpha: 0.90),
      barrierLabel: 'Choice Event',
      pageBuilder: (context, animation, secondaryAnimation) {
        return const EventChoicePopup();
      },
      transitionBuilder: slideFromTopBuilder,
      transitionDuration: const Duration(milliseconds: 750),
    ).then((value) {
      Get.delete<EventPopupController>();
    });
  } else if (number > 40 && number <= 80) // 40% of chances
  {
    Get.generalDialog(
      barrierDismissible: true,
      barrierColor: Colors.black54.withValues(alpha: 0.90),
      barrierLabel: 'Event', // Required for generalDialog
      pageBuilder: (context, animation, secondaryAnimation) {
        return EventPopup();
      },
      transitionBuilder: slideFromTopBuilder,
      transitionDuration: const Duration(milliseconds: 750),
    ).then((value) {
      final HomeController homeController = Get.find<HomeController>();
      final EventPopupController eventController =
          Get.find<EventPopupController>();

      // 1. Apply stat changes to the player character
      String? effectString = eventController.rndPopupEvent["popupEffectString"];

      if (effectString != null) {
        final effects = parseEffects(effectString);
        homeController.applyStatChanges(effects);
      }

      // 2. Get the Popup Text
      String popupText =
          eventController.rndPopupEvent["description"] ?? "An event occurred.";

      // 3. Save to Diary
      homeController.addEventToCurrentAge(popupText);

      homeController.addLifeStoryEntry(
        LifeStory(description: "You're now $age years old!", age: age),
      );

      // 4. After handling the choice, dismiss the dialog
      Get.delete<EventPopupController>();
    });
  }
}

// Reusable Transition Builder for "Slide from Top"
Widget slideFromTopBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return SlideTransition(
    position:
        Tween<Offset>(
          begin: const Offset(0, -1), // Starts above the screen (Top)
          end: Offset.zero, // Ends at center
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack, // Adds a nice bouncy effect
          ),
        ),
    child: child,
  );
}
