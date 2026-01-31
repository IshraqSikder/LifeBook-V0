import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_book/controllers/custom_animation_controller.dart';
import 'package:life_book/controllers/sound_service.dart';
import 'package:life_book/models/asset_model.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/services/asset_service.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/views/real_estates/asset_details_popup.dart';

class AssetController extends GetxController {
  final User player;

  AssetController({required this.player});

  late final RxList<AssetModel?> currentAsset;
  late final RxList<AssetModel> availableAssetItems;

  final UserService userService = Get.find<UserService>();
  final AssetService assetService = Get.find<AssetService>();


  @override
  void onInit() {
    super.onInit();
    currentAsset = assetService.currentAsset;
    availableAssetItems = assetService.availableAssets;
  }

  List<AssetModel> get sortedCurrentAssets {
    List<AssetModel> sortedList = List.from(currentAsset);

    sortedList.sort((a, b) {
      return a.price.compareTo(b.price);
    });

    return sortedList;
  }

  List<AssetModel> get sortedAvailableAssets {
    List<AssetModel> sortedList = List.from(availableAssetItems);

    int currentBalance = player.gameStats.balanceRx.value;

    sortedList.sort((a, b) {
      bool isA_Active = currentBalance >= a.price;
      bool isB_Active = currentBalance >= b.price;

      if (isA_Active && !isB_Active) return -1;
      if (!isA_Active && isB_Active) return 1;

      return a.price.compareTo(b.price);
    });

    return sortedList;
  }

  void buyAsset(AssetModel assetItem) async {
    await assetService.applyForNewAsset(assetItem);
    player.gameStats.balanceRx -= assetItem.price;

    player.userInfo.assets = assetItem;
    userService.saveUser(player);
    Get.find<SoundService>().singleKeyPress();
    Get.back();
  }

  void sellAsset(AssetModel item) async {
    final AssetModel? assetToResign = currentAsset.isNotEmpty ? item : null;
    if (assetToResign != null) {
      await assetService.resignCurrentAsset(assetToResign);
      player.gameStats.balanceRx += assetToResign.price;
    }

    player.userInfo.assets = null;
    userService.saveUser(player);
    Get.find<SoundService>().singleKeyPress();
    Get.back();
  }

  // Method to handle showing a job detail popup or similar
  void handleAssetTap(AssetModel item) {
    bool isCurrent = currentAsset.contains(item);
    showAssetDetailsPopup(item, isCurrent);
    Get.find<SoundService>().saberCut();
  }

  // Function to show the asset details popup
  void showAssetDetailsPopup(AssetModel item, bool isCurrent) {
    topToCenterAnimationPopup(AssetDetailsPopup(item: item, isCurrent: isCurrent), true);
  }
}
