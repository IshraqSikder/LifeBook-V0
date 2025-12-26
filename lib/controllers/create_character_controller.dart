import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/views/start/tutorial_screen.dart';

import '../services/CSV_services.dart';

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
    } else if (selectedGender.value == '' || selectedGender.value.isEmpty) {
      // Check if gender is selected
      Get.snackbar(
        'Error',
        'Please select your gender',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      // Generate a unique ID
      final int newId = _userService.generateUniqueId();

      // Siblings List
      List<Map<String, dynamic>> selectedSiblings = [];

      // random number generator for Siblings
      int rndNumber = Random().nextInt(100) + 1; // 1 to 100

      // random gender selection for Siblings
      bool isMale = Random().nextBool();

      if (rndNumber > 60 && rndNumber <= 90) {
        // Get 2 unique random siblings
        selectedSiblings = (List<Map<String, dynamic>>.from(
          elderSiblingsList,
        )..shuffle()).take(2).toList();
      } else if (rndNumber > 90 && rndNumber < 100) {
        // Get 1 random sibling
        selectedSiblings = (List<Map<String, dynamic>>.from(
          elderSiblingsList,
        )..shuffle()).take(1).toList();
      }
      // Create the UserInfo
      final UserInfo userInfo = UserInfo(
        id: newId,
        name: nameController.text.trim(),
        gender: selectedGender.value,
        school: {}, // Initialize with empty maps/lists
        job: null,
        assets: null,
        relationships: [
          Relationship(
            type: "Parents",
            relation: "Father",
            name: "${getRandomProfile()['firstName']} ${getRandomProfile()['lastName']}",
            age: getRandomProfile()['ageParents'],
            gender: 'Male',
            occupation: "${getRandomProfile()['occupation']}",
            imageUrl: "assets/images/relationships/man/${getRandomProfile()['imgMan']}",
            agreement: 0.5,
          ),
          Relationship(
            type: "Parents",
            relation: "Mother",
            name: "${getRandomProfile()['firstName']} ${getRandomProfile()['lastName']}",
            age: getRandomProfile()['ageParents'],
            gender: 'Female',
            occupation: "${getRandomProfile()['occupation']}",
            imageUrl: "assets/images/relationships/woman/${getRandomProfile()['imgWoman']}",
            agreement: 0.9,
          ),
          if (selectedSiblings.isNotEmpty)
            ...selectedSiblings.map((randomElderSiblings) {
              // random age for Siblings
              final int minAge = 1;
              final int maxAge = 10;
              return Relationship(
                type: "Siblings",
                relation: isMale ? 'Brother' : 'Sister',
                name: "${getRandomProfile()['firstName']} ${getRandomProfile()['lastName']}",
                age: minAge + Random().nextInt(maxAge - minAge + 1),
                gender: isMale ? 'Male' : 'Female',
                occupation: "${getRandomProfile()['occupation']}",
                imageUrl: isMale ? "assets/images/relationships/boy/${getRandomProfile()['imgBoy']}" : "assets/images/relationships/girl/${getRandomProfile()['imgGirl']}",
                agreement: 0.15,
              );
            }),
        ],
        activities: [],
      );

      // Create initial GameStats
      final GameStats gameStats = GameStats(
        levels: [
          Level(age: 0, experience: ["You're now 0 years old"]),
        ],
        balance: 0,
        happiness: 50,
        health: 50,
        smarts: 50,
        looks: 50,
      );

      // Create the full User object
      final User newPlayer = User(userInfo: userInfo, gameStats: gameStats);

      // Save the new player to Hive and set it as the active user
      await _userService.saveUser(newPlayer);

      Get.offAll(() => TutorialScreen(player: newPlayer));
    }
  }
}
