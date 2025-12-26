import 'dart:math';

import 'package:get/get.dart';
import 'package:life_book/models/asset_model.dart';
import 'package:life_book/models/job_model.dart';
import 'package:life_book/services/load_CSV.dart';

RxList<Map<String, dynamic>> agePopupList = <Map<String, dynamic>>[].obs;
RxList<Map<String, dynamic>> choiceEventList = <Map<String, dynamic>>[].obs;
RxList<Map<String, dynamic>> positiveEventList = <Map<String, dynamic>>[].obs;
RxList<Map<String, dynamic>> activityList = <Map<String, dynamic>>[].obs;
RxList<AssetModel> assetList = <AssetModel>[].obs;
RxList<JobModel> jobList = <JobModel>[].obs;

RxList<Map<String, dynamic>> fatherList = <Map<String, dynamic>>[].obs;
RxList<Map<String, dynamic>> motherList = <Map<String, dynamic>>[].obs;
RxList<Map<String, dynamic>> elderSiblingsList = <Map<String, dynamic>>[].obs;

// List of Data table variables
RxList<String> firstNamesList = <String>[].obs;
RxList<String> lastNamesList = <String>[].obs;
RxList<String> imgUrlManList = <String>[].obs;
RxList<String> imgUrlWomanList = <String>[].obs;
RxList<String> imgUrlBoyList = <String>[].obs;
RxList<String> imgUrlGirlList = <String>[].obs;
RxList<String> occupationsList = <String>[].obs;

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
      price: int.tryParse(row[5].toString()) ?? 0,
    );
  }).toList();
}

Future<void> loadJob() async {
  final data = await loadJobCSV();
  // final headers = data.first;
  final rows = data.skip(1);

  jobList.value = rows.map((row) {
    String imageName = row[1].toString();
    String fullImagePath = "assets/images/jobs/$imageName.png";

    return JobModel(
      id: row[0],
      imageUrl: fullImagePath,
      title: row[2].toString(),
      subtitle: row[3].toString(),
      description: row[4].toString(),
      salary: int.tryParse(row[5].toString()) ?? 0,
    );
  }).toList();
}

Future<void> loadElderSiblings() async {
  final data = await loadElderSiblingsCSV();
  // final headers = data.first;
  final rows = data.skip(1);

  elderSiblingsList.value = rows.map((row) {
    return {
      'id': row[0],
      'name': row[1],
      'age': row[2],
      'gender': row[3],
      'occupation': row[4],
      'imageUrl': row[5],
      'agreement': row[6],
    };
  }).toList();
}

Future<void> loadDataTable() async {
  final data = await loadDataTableCSV();
  // final headers = data.first;
  final rows = data.skip(1);

  firstNamesList.clear();
  lastNamesList.clear();
  imgUrlManList.clear();
  imgUrlWomanList.clear();
  imgUrlBoyList.clear();
  imgUrlGirlList.clear();
  occupationsList.clear();

  for (var row in rows) {
    if (row[1].toString().trim().isNotEmpty) {
      firstNamesList.add(row[1].toString());
    }
    if (row[2].toString().trim().isNotEmpty) {
      lastNamesList.add(row[2].toString());
    }
    if (row[3].toString().trim().isNotEmpty) {
      imgUrlManList.add(row[3].toString());
    }
    if (row[4].toString().trim().isNotEmpty) {
      imgUrlWomanList.add(row[4].toString());
    }
    if (row[5].toString().trim().isNotEmpty) {
      imgUrlBoyList.add(row[5].toString());
    }
    if (row[6].toString().trim().isNotEmpty) {
      imgUrlGirlList.add(row[6].toString());
    }
    if (row[7].toString().trim().isNotEmpty) {
      occupationsList.add(row[7].toString());
    }
  }
}

Map<String, dynamic> getRandomProfile() {
  final int minAge = 17;
  final int maxAge = 40;

  String randomFirstName = firstNamesList[Random().nextInt(firstNamesList.length)];
  String randomLastName = lastNamesList[Random().nextInt(lastNamesList.length)];
  int randomAgeForParents = minAge + Random().nextInt(maxAge - minAge + 1);  // Generates a number between 17 and 40 (inclusive)
  String randomImgMan = imgUrlManList[Random().nextInt(imgUrlManList.length)];
  String randomImgWoman = imgUrlWomanList[Random().nextInt(imgUrlWomanList.length)];

  String randomImgBoy = imgUrlBoyList[Random().nextInt(imgUrlBoyList.length)];
  String randomImgGirl = imgUrlGirlList[Random().nextInt(imgUrlGirlList.length)];

  String randomOccupation = occupationsList[Random().nextInt(occupationsList.length)];

  return {
    'firstName': randomFirstName,
    'lastName': randomLastName,
    'ageParents' : randomAgeForParents,
    'imgMan': randomImgMan,
    'imgWoman': randomImgWoman,
    'imgBoy': randomImgBoy,
    'imgGirl': randomImgGirl,
    'occupation': randomOccupation,
  };
}
