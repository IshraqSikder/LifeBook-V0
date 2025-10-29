import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_book/models/character.dart';
import 'package:life_book/screens/start/tutorial.dart';
import 'package:life_book/services/local_service.dart';

class CreateCharacterController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  // final RxString selectedGender = 'Male'.obs; // Make it observable
  late RxString selectedGender = RxString('');

  @override
  void onClose() {
    nameController.dispose();
    selectedGender.close();
    super.onClose();
  }

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  void startLife() {
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
      Character newPlayer = Character(
        name: nameController.text.trim(),
        gender: selectedGender.value,
      );

      LocalService().storeUser(newPlayer); // Store the character

      Get.offAll(() => TutorialScreen(player: newPlayer));
    }
  }
}
