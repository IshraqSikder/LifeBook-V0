import 'dart:math';
import 'dart:math' as math;

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

      var randomFather = fatherList[Random().nextInt(fatherList.length)];
      var randomMother = motherList[Random().nextInt(motherList.length)];
      // var randomElderSiblings = elderSiblingsList[Random().nextInt(elderSiblingsList.length)];
      List<Map<String, dynamic>> selectedSiblings = [];

      // random number generator
      final random = math.Random();
      int number = random.nextInt(100) + 1; // 1 to 100

      if (number > 60 && number <= 90) {
        // Get 2 unique random siblings
        selectedSiblings = (List<Map<String, dynamic>>.from(
          elderSiblingsList,
        )..shuffle()).take(2).toList();
      } else if (number > 90 && number < 100) {
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
            name: randomFather['name'],
            age: int.parse(randomFather['age'].toString()),
            gender: 'Male',
            occupation: randomFather['occupation'],
            imageUrl: randomFather['imageUrl'],
            agreement: randomFather['agreement'],
          ),
          Relationship(
            type: "Parents",
            relation: "Mother",
            name: randomMother['name'],
            age: int.parse(randomMother['age'].toString()),
            gender: 'Female',
            occupation: randomMother['occupation'],
            imageUrl: randomMother['imageUrl'],
            agreement: randomMother['agreement'],
          ),
          if (selectedSiblings.isNotEmpty)
            ...selectedSiblings.map((randomElderSiblings) {
              return Relationship(
                type: "Siblings",
                relation: randomElderSiblings['gender'] == 'Male'
                    ? "Brother"
                    : "Sister",
                name: randomElderSiblings['name'],
                age: int.parse(randomElderSiblings['age'].toString()),
                gender: randomElderSiblings['gender'],
                occupation: randomElderSiblings['occupation'],
                imageUrl: randomElderSiblings['imageUrl'],
                agreement: randomElderSiblings['agreement'],
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
