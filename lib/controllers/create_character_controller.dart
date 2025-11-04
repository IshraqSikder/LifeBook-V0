import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_book/services/user.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/views/start/tutorial_new.dart';

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

      print('Generated User ID: $newId');

      // Create the UserInfo
      final UserInfo userInfo = UserInfo(
        id: newId,
        name: nameController.text.trim(),
        gender: selectedGender.value,
        school: {}, // Initialize with empty maps/lists
        job: {},
        assets: [],
        relationships: [],
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

      Get.offAll(() => TutorialScreenNew(player: newPlayer));
    }
  }
}
