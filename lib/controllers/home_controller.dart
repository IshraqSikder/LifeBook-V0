import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_book/controllers/event_popup_controller.dart';
import 'package:life_book/services/CSV_services.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/views/death/death_screen.dart';
import 'package:life_book/views/home/life_story.dart';
import 'package:life_book/views/school/school_popup.dart';

class HomeController extends GetxController {
  final User player;
  final dynamic choice;

  HomeController({required this.player, this.choice});

  RxBool isMenuToggled = false.obs;
  final RxList<LifeStory> lifeStoryDiaryEntries = [
    LifeStory(age: 0, description: "You're now 0 years old!"),
  ].obs;

  final UserService userService = Get.find<UserService>();

  final ScrollController scrollController =
      ScrollController(); // Define Scroll Controller here

  @override
  void onInit() {
    super.onInit();

    // Listen to changes in levels and scroll down
    ever(userService.activeUser!.gameStats.levelsRx, (_) {
      scrollToBottom();
    });

    // Initial scroll to bottom when entering the screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToBottom();
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void scrollToBottom() {
    // Adding a tiny delay ensures the ListView has finished rendering the new item before we try to scroll to it.
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
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
    // age increment for all profiles
    int newAge = player.gameStats.levelsRx.last.age + 1;
    for (var rel in player.userInfo.relationships) {
      rel.age++;
    }

    // Find matching age entry from the list using newAge
    var ageEntry = agePopupList.firstWhere(
      (item) => item['age'] == newAge,
      orElse: () => {},
    );

    String diaryEntry;
    if (ageEntry.isNotEmpty && ageEntry['ageMessage'] != null) {
      diaryEntry = "You're now $newAge years old!\n${ageEntry['ageMessage']}";
    } else {
      diaryEntry = "You're now $newAge years old!";
    }

    // Calculate salary (default to 0 if no job)
    int currentSalary = player.userInfo.job?.salary ?? 0;

    // Update the RxInt value explicitly
    player.gameStats.balanceRx.value += currentSalary;

    // Save the age and add the diary entry
    await savePlayerLevel(newAge, diaryEntry);

    // Check for events
    bool isEvent = _eventOccurs();
    if (!isEvent) {
      addLifeStoryEntry(LifeStory(age: newAge, description: diaryEntry));
    }

    // Check for School Popup
    if (newAge == 5) {
      Get.dialog(
        SchoolPopup(player: player),
        barrierDismissible: false,
        barrierColor: Colors.black54.withValues(alpha: 0.90),
      );
    }

    // Check for death
    if (newAge == 35) {
      Get.to(() => DeathScreen(player: player));
    }

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
    player.gameStats.levelsRx.add(newLevel);
    await userService.saveUser(player);
  }
}
