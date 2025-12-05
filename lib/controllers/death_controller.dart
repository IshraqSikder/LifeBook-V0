import 'package:get/get.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/services/asset_service.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/views/jobs/job_service.dart';

class DeathScreenController extends GetxController {
  final User player;
  DeathScreenController(this.player);

  final UserService userService = Get.find<UserService>();
  final JobService jobService = Get.find<JobService>();
  final AssetService assetService = Get.put(AssetService());

  void endGame() {
    assetService.clearAllAssetData();
    jobService.clearAllJobData();
    userService.clearAllUsersData();
    Get.offAllNamed('/start');
  }
}
