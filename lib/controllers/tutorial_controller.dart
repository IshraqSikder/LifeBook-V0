import 'package:get/get.dart';
import 'package:life_book/models/character.dart';
import 'package:life_book/views/home/home_new.dart';

class TutorialScreenController extends GetxController {
  final Character player; // Player is now required in the controller again

  TutorialScreenController(this.player);

  void goToHomeScreen() {
    Get.offAll(HomeScreenNew(player: player));
  }
}
