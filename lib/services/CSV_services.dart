import 'package:get/get.dart';
import 'package:life_book/models/asset_model.dart';
import 'package:life_book/services/load_CSV.dart';

RxList<Map<String, dynamic>> agePopupList = <Map<String, dynamic>>[].obs;
RxList<Map<String, dynamic>> choiceEventList = <Map<String, dynamic>>[].obs;
RxList<Map<String, dynamic>> positiveEventList = <Map<String, dynamic>>[].obs;
RxList<Map<String, dynamic>> activityList = <Map<String, dynamic>>[].obs;
RxList<AssetModel> assetList = <AssetModel>[].obs;

Future<void> loadAgePopup() async {
  final data = await loadAgePopupCSV();
  // final headers = data.first;
  final rows = data.skip(1);

  agePopupList.value = rows.map((row) {
    return {'age': row[0], 'ageMessage': row[1]};
  }).toList();
}

Future<void> loadChoiceEvent() async {
  final data = await loadChoiceEventCSV();
  // final headers = data.first;
  final rows = data.skip(1);

  choiceEventList.value = rows.map((row) {
    return {
      'id': row[0],
      'title': row[1],
      'description': row[2],
      'choiceAText': row[3],
      'choiceAEffect': row[4],
      'choiceBText': row[5],
      'choiceBEffect': row[6],
    };
  }).toList();
}

Future<void> loadPositiveEvent() async {
  final data = await loadPositiveEventCSV();
  // final headers = data.first;
  final rows = data.skip(1);

  positiveEventList.value = rows.map((row) {
    return {
      'id': row[0],
      'title': row[1],
      'description': row[2],
      'popupEffectString': row[3],
    };
  }).toList();
}

// Parse effects like "Health:+10;Happiness:-3"
Map<String, int> parseEffects(String effectString) {
  Map<String, int> effects = {};
  if (effectString.trim().isEmpty) return effects;

  for (var part in effectString.split(';')) {
    var pieces = part.split(':');
    if (pieces.length == 2) {
      String key = pieces[0].trim();
      int value = int.tryParse(pieces[1].trim()) ?? 0;
      effects[key] = value;
    }
  }
  return effects;
}

Future<void> loadActivity() async {
  final data = await loadActivityCSV();
  // final headers = data.first;
  final rows = data.skip(1);

  activityList.value = rows.map((row) {
    return {
      'id': row[0],
      'imageUrl': row[1],
      'title': row[2],
      'subtitle': row[3],
      'description': row[4],
      'price': row[5],
      'effect': row[6],
    };
  }).toList();
}

Future<void> loadAsset() async {
  final data = await loadAssetCSV();
  // final headers = data.first;
  final rows = data.skip(1);

  assetList.value = rows.map((row) {
    return AssetModel(
      id: row[0],
      imageUrl: row[1],
      title: row[2],
      subtitle: row[3],
      description: row[4],
      // price: row[5],
      price: int.tryParse(row[5].toString()) ?? 0,
    );
  }).toList();
}