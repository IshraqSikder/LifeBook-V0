// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:life_book/models/user.dart';
// import 'package:life_book/services/asset_service.dart';
// import 'package:life_book/services/user_service.dart';
// import 'package:life_book/views/jobs/job_service.dart';
//
// class DeathScreenController extends GetxController {
//   final User player;
//   DeathScreenController(this.player);
//
//   final UserService userService = Get.find<UserService>();
//   final JobService jobService = Get.find<JobService>();
//   final AssetService assetService = Get.put(AssetService());
//
//   void endGame() {
//     assetService.clearAllAssetData();
//     jobService.clearAllJobData();
//     userService.clearAllUsersData();
//     // userService.clearActiveUser();
//
//     // Hive.deleteBoxFromDisk('usersBox');
//
//     // Hive.box('usersBox').clear();
//
//     Get.offAllNamed('/start');
//   }
// }
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

  // CHANGED: Use Get.find to get the service that actually holds the old data
  final AssetService assetService = Get.find<AssetService>();

  // CHANGED: Added 'async'
  Future<void> endGame() async {
    // CHANGED: Added 'await' to ensure data is gone before moving screens
    await assetService.clearAllAssetData();
    await jobService.clearAllJobData();
    await userService.clearAllUsersData();

    Get.offAllNamed('/start');
  }
}