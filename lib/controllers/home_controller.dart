import 'dart:math';
import 'package:get/get.dart';
import 'package:life_book/controllers/event_popup_controller.dart';
import 'package:life_book/models/age_popup_list.dart';
import 'package:life_book/services/user.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/views/death/death_screen.dart';
import 'package:life_book/screens/home/life_story.dart';

class HomeController extends GetxController {
  final User player;
  final dynamic choice;

  HomeController({required this.player, this.choice});

  RxBool isMenuToggled = false.obs;
  final RxList<LifeStory> lifeStoryDiaryEntries = [
    LifeStory(age: 0, description: "You're now 0 years old!"),
  ].obs;

  final UserService userService = Get.find<UserService>();

  // Method to toggle the menu state
  void toggleMenu() {
    isMenuToggled.value = !isMenuToggled.value;
  }

  // Method to handle age increment and add a new entry
  void addLifeStoryEntry(LifeStory newStoryEntry) {
    lifeStoryDiaryEntries.add(newStoryEntry);
  }

  // You can also add a getter for the combined description if needed
  String getCombinedDescription(Level entry) {
    if (agePopupList.containsKey(entry.age)) {
      return "${entry.experience}\n${agePopupList[entry.age]}";
    }
    return entry.experience.join('\n');
  }

  // New method to handle the age increment logic from FAB
  void incrementAge() async {
    Level currentLevel = player.gameStats.levels.first;
    currentLevel.incrementAge();
    String diaryEntry = "You're now ${currentLevel.age} years old!";

    // Save the age and add the diary entry
    await savePlayerLevel(currentLevel.age, diaryEntry);

    // Check for events
    bool isEvent = _eventOccurs();
    if (!isEvent) {
      // If no event, add a generic age story
      addLifeStoryEntry(
        LifeStory(age: currentLevel.age, description: diaryEntry),
      );
    }

    // Check for death
    if (currentLevel.age == 10) {
      Get.to(() => DeathScreen(player: player));
    }
  }

  bool _eventOccurs() {
    final random = Random();
    int number = random.nextInt(100) + 1; // 1 to 100
    if (number <= 40) // 40% of chances
    {
      showEventPopupGetX(player.gameStats.levels.first.age);
      return true;
    }
    return false;
  }

  // Method to save player level and diary entry
  Future<void> savePlayerLevel(int currentAge, String diaryEntry) async {
    // Level currentLevel = player.gameStats.levels.first;
    // currentLevel.experience.add(diaryEntry);
    final newLevel = Level(age: currentAge, experience: [diaryEntry]);
    player.gameStats.levels.add(newLevel);
    await userService.saveUser(player);
  }
}
