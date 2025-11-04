import 'package:get/get.dart';
import 'package:life_book/services/user.dart';
import 'package:life_book/services/user_service.dart';

class DeathScreenController extends GetxController {
  // final Character player;
  final User player;
  DeathScreenController(this.player);

  final UserService userService = Get.find<UserService>();

  void endGame() {
    userService.clearActiveUser();
    Get.offAllNamed('/start');
  }
}
