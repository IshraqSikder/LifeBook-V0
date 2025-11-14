import 'package:get/get.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/views/jobs/job_service.dart';

class DeathScreenController extends GetxController {
  final User player;
  DeathScreenController(this.player);

  final UserService userService = Get.find<UserService>();
  final JobService jobService = Get.find<JobService>();

  void endGame() {
    jobService.clearAllJobData();
    userService.clearAllUsersData();
    Get.offAllNamed('/start');
  }
}
