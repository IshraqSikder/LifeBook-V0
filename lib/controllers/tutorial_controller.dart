import 'package:get/get.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/views/home/home.dart';

class TutorialScreenController extends GetxController {
  final User player;

  TutorialScreenController(this.player);

  void goToHomeScreen() {
    Get.offAll(HomeScreenNew(player: player));
  }
}
