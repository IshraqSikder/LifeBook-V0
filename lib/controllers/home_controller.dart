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
    return entry.experience.join('\n');
  }

  // New method to handle the age increment logic from FAB
  void incrementAge() async {
    Level currentLevel = player.gameStats.levels.first;
    currentLevel.incrementAge();
    String diaryEntry;
    String? ageMessage;
    if (agePopupList.containsKey(currentLevel.age)) {
      ageMessage = "${agePopupList[currentLevel.age]}";
    }
    // Check if ageMessage is not null & empty
    if (ageMessage != null && ageMessage.isNotEmpty) {
      diaryEntry = "You're now ${currentLevel.age} years old!\n$ageMessage";
    } else {
      diaryEntry = "You're now ${currentLevel.age} years old!";
    }
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
    if (currentLevel.age == 30) {
      Get.to(() => DeathScreen(player: player));
    }

    // add salary after every age up
    player.gameStats.balance += player.userInfo.job?.salary ?? 0;
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

  Map<String, RxInt> get allStats => {
    "Happiness": player.gameStats.happinessRx,
    "Health": player.gameStats.healthRx,
    "Smarts": player.gameStats.smartsRx,
    "Looks": player.gameStats.looksRx,
  };

  // Method to apply stat changes
  void applyStatChanges(Map<String, dynamic> changes) async {
    changes.forEach((statName, value) {
      final RxInt? stat = allStats[statName];
      if (stat != null && value is int) {
        stat.value += value;
        stat.value = stat.value.clamp(0, 100);
      }
    });
    await userService.saveUser(player);
  }

  // Method to save player level and diary entry
  Future<void> savePlayerLevel(int currentAge, String diaryEntry) async {
    final newLevel = Level(age: currentAge, experience: [diaryEntry]);
    player.gameStats.levels.add(newLevel);
    await userService.saveUser(player);
  }
}
