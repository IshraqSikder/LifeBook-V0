// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:life_book/models/asset_model.dart';
// import 'package:life_book/models/user.dart';
// import 'package:life_book/services/asset_service.dart';
// import 'package:life_book/services/user_service.dart';
// import 'package:life_book/views/jobs/job_details_popup.dart';
// import 'package:life_book/views/jobs/job_model.dart';
// import 'package:life_book/views/jobs/job_popup.dart';
// import 'package:life_book/views/jobs/job_service.dart';

// class AssetController extends GetxController {
//   final User player;

//   AssetController({required this.player});

//   late final Rx<AssetModel?> currentAsset;
//   late final RxList<AssetModel> availableAssetItems;

//   final UserService userService = Get.find<UserService>();
//   final AssetService assetService = Get.find<AssetService>();

//   @override
//   void onInit() {
//     super.onInit();
//     currentAsset = assetService.currentAsset;
//     availableAssetItems = assetService.availableAssets;
//   }

//   void applyForAsset(AssetModel assetItem) async {
//     if (currentAsset.value == null) {
//       await assetService.applyForNewAsset(assetItem);
//       player.gameStats.balance += assetItem.price;

//       // Get.dialog(
//       //   barrierDismissible: true,
//       //   barrierColor: Colors.black54.withValues(alpha: 0.95),
//       //   AssetPopup(player: player, item: assetItem),
//       // );
//     } else {
//       Get.dialog(
//         barrierDismissible: true,
//         barrierColor: Colors.black54.withValues(alpha: 0.95),
//         alreadyApplyJob(),
//       );
//     }

//     player.userInfo.assets = assetItem;
//     userService.saveUser(player);
//   }

//   void resignAsset() async {
//     final AssetModel? assetToResign = currentAsset.value;
//     if (assetToResign != null) {
//       await assetService.resignCurrentAsset();
//     }

//     player.userInfo.assets = null;
//     userService.saveUser(player);
//     Get.back();
//   }

//   // Method to handle showing a job detail popup or similar
//   void handleJobTap(BuildContext context, AssetModel item) {
//     if (currentAsset.value == item) {
//       // showJobDetailsPopup(context, item);
//     } else if (availableAssetItems.contains(item)) {
//       applyForAsset(item);
//     }
//   }

//   // Function to show the job details popup
//   // void showJobDetailsPopup(BuildContext context, AssetModel item) {
//   //   Get.dialog(
//   //     AssetDetailsPopup(item: item),
//   //     barrierDismissible: true,
//   //     barrierColor: Colors.black54.withValues(alpha: 0.90),
//   //   );
//   // }
// }
