import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'package:life_book/models/asset_model.dart';
import 'package:life_book/services/CSV_services.dart';

class AssetService extends GetxService {
  static const String _assetBoxName = 'assetItemsBox';
  static const String _currentAssetBoxName = 'currentAssetItemBox';

  late Box<AssetModel> _assetBox;
  late Box<AssetModel> _currentAssetBox;

  final RxList<AssetModel> _availableAssets = <AssetModel>[].obs;
  RxList<AssetModel> get availableAssets => _availableAssets;

  final RxList<AssetModel?> _currentAsset = RxList<AssetModel?>([]);
  RxList<AssetModel?> get currentAsset => _currentAsset;

  @override
  Future<void> onInit() async {
    super.onInit();
    _assetBox = await Hive.openBox<AssetModel>(_assetBoxName);
    _currentAssetBox = await Hive.openBox<AssetModel>(_currentAssetBoxName);

    // Load asset data from CSV
    if (_assetBox.isEmpty) {
      for (var item in assetList) {
        await _assetBox.add(item);
      }
    }

    _availableAssets.assignAll(_assetBox.values.toList());

    if (_currentAssetBox.isNotEmpty) {
      _currentAsset.assignAll(_currentAssetBox.values.toList());
    }
  }

  Future<void> applyForNewAsset(AssetModel assetItem) async {
    await removeAssetFromAvailable(assetItem);
    await _currentAssetBox.add(assetItem);
    _currentAsset.add(assetItem);
  }

  Future<void> resignCurrentAsset(AssetModel assetItem) async {
    dynamic keyToRemove;

    for (var key in _currentAssetBox.keys) {
      final item = _currentAssetBox.get(key);
      if (item?.title == assetItem.title) {
        keyToRemove = key;
        break;
      }
    }

    if (keyToRemove != null) {
      await _currentAssetBox.delete(keyToRemove);
    }

    _currentAsset.remove(assetItem);
    await addAssetToAvailable(assetItem);
  }

  Future<void> addAssetToAvailable(AssetModel assetItem) async {
    await _assetBox.add(assetItem);
    _availableAssets.add(assetItem);
  }

  Future<void> removeAssetFromAvailable(AssetModel assetItem) async {
    dynamic assetKey;
    for (var key in _assetBox.keys) {
      final item = _assetBox.get(key);
      if (item?.title == assetItem.title) {
        assetKey = key;
        break;
      }
    }
    if (assetKey != null) {
      await _assetBox.delete(assetKey);
    }
    _availableAssets.remove(assetItem);
  }

  Future<void> clearAllAssetData() async {
    await _assetBox.clear();
    await _currentAssetBox.clear();

    if (_assetBox.isEmpty) {
      for (var item in assetList) {
        await _assetBox.add(item);
      }
    }
    _availableAssets.assignAll(_assetBox.values.toList());
    _currentAsset.clear();
  }
}
