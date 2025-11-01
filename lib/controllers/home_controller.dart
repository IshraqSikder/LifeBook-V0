import 'dart:math';
import 'package:get/get.dart';
import 'package:life_book/controllers/event_popup_controller.dart';
import 'package:life_book/models/character.dart';
import 'package:life_book/models/age_popup_list.dart';
import 'package:life_book/views/death/death_screen.dart';
import 'package:life_book/screens/home/life_story.dart';

class HomeController extends GetxController {
  final Character player;
  final dynamic choice;

  HomeController({required this.player, this.choice});

  RxBool isMenuToggled = false.obs;
  final RxList<LifeStory> lifeStoryDiaryEntries = [
    LifeStory(age: 0, description: "You're now 0 years old!"),
  ].obs;

  // Method to toggle the menu state
  void toggleMenu() {
    isMenuToggled.value = !isMenuToggled.value;
  }

  // Method to handle age increment and add a new entry
  void addLifeStoryEntry(LifeStory newStoryEntry) {
    lifeStoryDiaryEntries.add(newStoryEntry);
  }

  // You can also add a getter for the combined description if needed
  String getCombinedDescription(LifeStory entry) {
    if (agePopupList.containsKey(entry.age)) {
      return "${entry.description}\n${agePopupList[entry.age]}";
    }
    return entry.description;
  }

  // New method to handle the age increment logic from FAB
  void incrementAge() {
    player.incrementAge();

    // Check for events
    bool isEvent = _eventOccurs(); // Call a private helper method
    if (!isEvent) {
      // If no event, add a generic age story
      addLifeStoryEntry(
        LifeStory(
          age: player.age.value,
          description: "You're now ${player.age} years old!",
        ),
      );
    }

    // Check for death
    if (player.age.value == 35) {
      Get.to(() => DeathScreen(player: player));
    }
  }

  // Helper function for events, now managed within the controller or a service
  bool _eventOccurs() {
    final random = Random();
    int number = random.nextInt(100) + 1; // 1 to 100
    if (number <= 40) // 40% of chances
    {
      showEventPopupGetX(player.age.value);
      return true;
    }
    return false;
  }
}
