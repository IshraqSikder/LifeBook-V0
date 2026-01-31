import 'package:get/get.dart';
import 'package:life_book/controllers/sound_service.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/views/home/home_screen.dart';

class TutorialScreenController extends GetxController {
  final User player;

  TutorialScreenController(this.player);

  void goToHomeScreen() {
    Get.find<SoundService>().childLaugh();
    Get.offAll(() => HomeScreen(player: player));
  }
}
