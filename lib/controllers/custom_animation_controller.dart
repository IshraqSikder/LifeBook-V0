import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAnimationController extends GetxController {
  CustomAnimationController();

  // 1. Variable to control Bottom Bar visibility
  var isNavBarVisible = true.obs;

  // 2. Helper function to handle the specific navigation animation
  Future<void> navigateToTabWithAnimation(Widget page) async {
    // Slide Bottom Bar Down
    isNavBarVisible.value = false;

    // Wait for the slide-down animation to finish (approx 200ms) depending on bottom navbar transition duration
    await Future.delayed(const Duration(milliseconds: 200));

    await Get.to(
      () => page,
      transition: Transition.downToUp,
      duration: const Duration(milliseconds: 300),
      opaque: false,
      fullscreenDialog: true, // Helps with layout handling
    );

    // When we return (pop), slide Bottom Bar back Up
    isNavBarVisible.value = true;
  }
}
