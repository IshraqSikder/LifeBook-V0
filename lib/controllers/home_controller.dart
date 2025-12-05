import 'dart:math';
import 'package:get/get.dart';
import 'package:life_book/controllers/event_popup_controller.dart';
import 'package:life_book/services/CSV_services.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/views/death/death_screen.dart';
import 'package:life_book/views/home/life_story.dart';

class HomeController extends GetxController {
  final User player;
  final dynamic choice;

  HomeController({required this.player, this.choice});

  RxBool isMenuToggled = false.obs;
  final RxList<LifeStory> lifeStoryDiaryEntries = [
    LifeStory(age: 0, description: "You're now 0 years old!"),
  ].obs;

  final UserService userService = Get.find<UserService>();

  @override
  void onInit() async {
    super.onInit();
    await loadAgePopup();
    await loadPositiveEvent();
    await loadChoiceEvent();
    await loadActivity();
    await loadAsset();
  }

  // Method to toggle the menu state
  void toggleMenu() {
    isMenuToggled.value = !isMenuToggled.value;
  }

  // Method to handle age increment and add a new entry
  void addLifeStoryEntry(LifeStory newStoryEntry) {
    lifeStoryDiaryEntries.add(newStoryEntry);
  }

  String getCombinedDescription(Level entry) {
    return entry.experience.join('\n');
  }

  void incrementAge() async {
    Level lastLevel = player.gameStats.levelsRx.last;

    int newAge = lastLevel.age + 1;

    String diaryEntry;

    // Find matching age entry from the list using newAge
    var ageEntry = agePopupList.firstWhere(
          (item) => item['age'] == newAge,
      orElse: () => {},
    );

    if (ageEntry.isNotEmpty && ageEntry['ageMessage'] != null) {
      diaryEntry =
      "You're now $newAge years old!\n${ageEntry['ageMessage']}";
    } else {
      diaryEntry = "You're now $newAge years old!";
    }

    // Save the age and add the diary entry
    await savePlayerLevel(newAge, diaryEntry);

    // Check for events
    bool isEvent = _eventOccurs();
    if (!isEvent) {
      addLifeStoryEntry(
        LifeStory(age: newAge, description: diaryEntry),
      );
    }

    // Check for death
    if (newAge == 30) {
      Get.to(() => DeathScreen(player: player));
    }

    // Update Salary
    player.gameStats.balance += player.userInfo.job?.salary ?? 0;

    // Force UI update if necessary (since we didn't use the Rx variable inside the list item)
    player.gameStats.levelsRx.refresh();
  }

  // Append choice event details to the current age's persistent data
  Future<void> addEventToCurrentAge(String eventText) async {
    if (player.gameStats.levelsRx.isNotEmpty) {
      Level currentLevel = player.gameStats.levelsRx.last;

      currentLevel.experience.add(eventText);

      player.gameStats.levelsRx.refresh();

      await userService.saveUser(player);
    }
  }

  bool _eventOccurs() {
    final random = Random();
    int number = random.nextInt(100) + 1; // 1 to 100
    if (number <= 40) // 40% of chances
    {
      // showEventPopupGetX(player.gameStats.levels.first.age);
      showEventPopupGetX(player.gameStats.levelsRx.last.age);
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
    player.gameStats.levelsRx.value.add(newLevel);
    await userService.saveUser(player);
  }
}
