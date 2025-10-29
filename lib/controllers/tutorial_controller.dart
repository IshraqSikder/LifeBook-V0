import 'package:get/get.dart';
import 'package:life_book/models/character.dart';

class TutorialScreenController extends GetxController {
  final Character player; // Player is now required in the controller again

  TutorialScreenController(this.player);

  void goToHomeScreen() {
    Get.offAllNamed('/home', arguments: player);
  }
}
