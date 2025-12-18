import 'package:get/get.dart';
import 'package:life_book/controllers/asset_controller.dart';
import 'package:life_book/controllers/home_controller.dart';
import 'package:life_book/controllers/job_controller.dart';
import 'package:life_book/services/asset_service.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/services/job_service.dart';

class DeathScreenController extends GetxController {
  DeathScreenController();

  final UserService userService = Get.find<UserService>();
  final JobService jobService = Get.find<JobService>();
  final AssetService assetService = Get.find<AssetService>();

  Future<void> endGame() async {

    // Hive.deleteBoxFromDisk('usersBox');

    // 1. Clear previous data
    await assetService.clearAllAssetData();
    await jobService.clearAllJobData();
    await userService.clearAllUsersData();

    // 2. Delete old controllers so they are forced to re-initialize with the NEW player
    Get.delete<HomeController>(force: true);
    Get.delete<JobController>(force: true);
    Get.delete<AssetController>(force: true);


    Get.offAllNamed('/start');
  }
}