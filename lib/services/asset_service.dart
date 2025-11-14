// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:get/get.dart';
// import 'package:life_book/models/asset_model.dart';
// import 'package:life_book/services/CSV_services.dart';

// class AssetService extends GetxService {
//   static const String _assetBoxName = 'assetItemsBox';
//   static const String _currentAssetBoxName = 'currentAssetItemBox';

//   late Box<AssetModel> _assetBox;
//   late Box<AssetModel> _currentAssetBox;

//   final RxList<AssetModel> _availableAssets = <AssetModel>[].obs;
//   RxList<AssetModel> get availableAssets => _availableAssets;

//   final Rx<AssetModel?> _currentAsset = Rx<AssetModel?>(null);
//   Rx<AssetModel?> get currentAsset => _currentAsset;

//   @override
//   Future<void> onInit() async {
//     super.onInit();
//     _assetBox = await Hive.openBox<AssetModel>(_assetBoxName);
//     _currentAssetBox = await Hive.openBox<AssetModel>(_currentAssetBoxName);

//     if (_assetBox.isEmpty) {
//       for (var item in assetList) {
//         await _assetBox.add(item);
//       }
//     }
//     _availableAssets.assignAll(_assetBox.values.toList());

//     if (_currentAssetBox.isNotEmpty) {
//       _currentAsset.value = _currentAssetBox.values.first;
//     }
//   }

//   Future<void> applyForNewAsset(AssetModel assetItem) async {
//     if (_currentAsset.value != null) {
//       return;
//     }

//     await removeAssetFromAvailable(assetItem); // remove from assetBox and list
//     await _currentAssetBox.clear();
//     await _currentAssetBox.add(assetItem);
//     _currentAsset.value = assetItem;
//   }

//   Future<void> resignCurrentAsset() async {
//     final AssetModel? assetToResign = _currentAsset.value;

//     if (assetToResign == null) {
//       return;
//     }

//     await _currentAssetBox.clear();
//     _currentAsset.value = null;

//     await addAssetToAvailable(assetToResign); // add to assetBox and list
//   }

//   Future<void> addAssetToAvailable(AssetModel assetItem) async {
//     await _assetBox.add(assetItem);
//     _availableAssets.add(assetItem);
//   }

//   Future<void> removeAssetFromAvailable(AssetModel assetItem) async {
//     dynamic assetKey;
//     for (var key in _assetBox.keys) {
//       final item = _assetBox.get(key);
//       if (item?.title == assetItem.title) {
//         assetKey = key;
//         break;
//       }
//     }
//     if (assetKey != null) {
//       await _assetBox.delete(assetKey);
//     }
//     _availableAssets.remove(assetItem);
//   }

//   Future<void> clearAllAssetData() async {
//     await _assetBox.clear();
//     await _currentAssetBox.clear();

//     if (_assetBox.isEmpty) {
//       for (var item in assetList) {
//         await _assetBox.add(item);
//       }
//     }
//     _availableAssets.assignAll(_assetBox.values.toList());
//     _currentAsset.value = null;
//   }
// }
