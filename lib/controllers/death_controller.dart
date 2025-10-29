import 'package:get/get.dart';
import 'package:life_book/models/character.dart';

class DeathScreenController extends GetxController {
  final Character player;
  DeathScreenController(this.player);

  void endGame() {
    Get.offAllNamed('/start');
  }
}
