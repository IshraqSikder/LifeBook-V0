import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/views/start/tutorial_screen.dart';

import '../services/csv_services.dart';

class CreateCharacterController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  late RxString selectedGender = RxString('');

  final UserService _userService = Get.put(UserService(), permanent: true);

  @override
  void onClose() {
    nameController.dispose();
    selectedGender.close();
    super.onClose();
  }

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  Future<void> startLife() async {
    if (nameController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your name',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (selectedGender.value == '' || selectedGender.value.isEmpty) {
      // Check if gender is selected
      Get.snackbar(
        'Error',
        'Please select your gender',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Generate a unique ID
    final int newId = _userService.generateUniqueId();

    // random number generator for Siblings
    int rndNumber = Random().nextInt(100) + 1; // 1 to 100
    // 60% chance for no siblings, 30% chance for 2 siblings, 10% chance for 1 siblings
    int elderSiblingCount = (rndNumber > 60 && rndNumber <= 90) ? 2 : (rndNumber > 90 ? 1 : 0);

    List<Relationship> initialRelationships = [];
    // Add Father
    final fatherData = getRandomProfile();
    initialRelationships.add(
      Relationship(
        type: "Parents",
        relation: "Father",
        name: "${fatherData['firstName']} ${fatherData['lastName']}",
        age: fatherData['ageParents'],
        gender: 'Male',
        occupation: "${fatherData['occupation']}",
        imageUrl: "assets/images/relationships/man/${fatherData['imgMan']}",
        agreement: 0.3,
        stats: generateRandomNPCStats(),
      ),
    );

    // Add Mother
    final motherData = getRandomProfile();
    initialRelationships.add(
      Relationship(
        type: "Parents",
        relation: "Mother",
        name: "${motherData['firstName']} ${motherData['lastName']}",
        age: motherData['ageParents'],
        gender: 'Female',
        occupation: "${motherData['occupation']}",
        imageUrl: "assets/images/relationships/woman/${motherData['imgWoman']}",
        agreement: 0.3,
        stats: generateRandomNPCStats(),
      ),
    );

    // Add Siblings (Randomly determined count)
    for (var i = 0; i < elderSiblingCount; i++) {
      final elderSibData = getRandomProfile();
      final bool sibIsMale = Random().nextBool(); // Randomize sibling gender

      initialRelationships.add(
        Relationship(
          type: "Siblings",
          relation: sibIsMale ? 'Brother' : 'Sister',
          name: "${elderSibData['firstName']} ${elderSibData['lastName']}",
          age: 1 + Random().nextInt(10), // min age 1, max age 10
          gender: sibIsMale ? 'Male' : 'Female',
          occupation: "${elderSibData['occupation']}",
          imageUrl: sibIsMale? "assets/images/relationships/boy/${elderSibData['imgBoy']}" : "assets/images/relationships/girl/${elderSibData['imgGirl']}",
          agreement: 0.15,
          stats: generateRandomNPCStats(),
        ),
      );
    }

    // Create the UserInfo
    final UserInfo userInfo = UserInfo(
      id: newId,
      name: nameController.text.trim(),
      gender: selectedGender.value,
      school: {}, // Initialize with empty maps/lists
      job: null,
      assets: null,
      relationships: initialRelationships,
      activities: [],
    );

    // Create initial GameStats
    final rnd = Random();
    final GameStats gameStats = GameStats(
      levels: [
        Level(age: 0, experience: ["You're now 0 years old"]),
      ],
      balance: 0,
      coreStats: CoreStats(
        happiness: rnd.nextInt(30) + 35, // 35-65
        health: rnd.nextInt(30) + 35, // 35-65
        smarts: rnd.nextInt(30) + 35, // 35-65
        looks: rnd.nextInt(30) + 35, // 35-65
      ),
    );

    // Create the full User object
    final User newPlayer = User(userInfo: userInfo, gameStats: gameStats);

    // Save the new player to Hive and set it as the active user
    await _userService.saveUser(newPlayer);

    Get.offAll(() => TutorialScreen(player: newPlayer));
  }

  // Helper method for random stats
  CoreStats generateRandomNPCStats() {
    final r = Random();
    return CoreStats(
      happiness: r.nextInt(50) + 15, // 15-65
      health: r.nextInt(50) + 15, // 15-65
      smarts: r.nextInt(50) + 15, // 15-65
      looks: r.nextInt(50) + 15, // 15-65
    );
  }
}
