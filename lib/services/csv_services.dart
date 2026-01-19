import 'dart:math';
import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:life_book/models/asset_model.dart';
import 'package:life_book/models/job_model.dart';

// Global Lists
final RxList<Map<String, dynamic>> agePopupList = <Map<String, dynamic>>[].obs;
final RxList<Map<String, dynamic>> choiceEventList = <Map<String, dynamic>>[].obs;
final RxList<Map<String, dynamic>> positiveEventList = <Map<String, dynamic>>[].obs;
final RxList<Map<String, dynamic>> activityList = <Map<String, dynamic>>[].obs;
final RxList<AssetModel> assetList = <AssetModel>[].obs;
final RxList<JobModel> jobList = <JobModel>[].obs;

// List of Data table variables
final RxList<String> firstNamesList = <String>[].obs;
final RxList<String> lastNamesList = <String>[].obs;
final RxList<String> imgUrlManList = <String>[].obs;
final RxList<String> imgUrlWomanList = <String>[].obs;
final RxList<String> imgUrlBoyList = <String>[].obs;
final RxList<String> imgUrlGirlList = <String>[].obs;
final RxList<String> occupationsList = <String>[].obs;

Future<void> loadAgePopup() async {
  final data = await loadGenericCSV("assets/csv_list/age_popup.csv");
  if (data.isEmpty) return;
  agePopupList.assignAll(data.skip(1).map((row) => {
    'age': row[0],
    'ageMessage': row[1]}).toList()
  );
}

Future<void> loadChoiceEvent() async {
  final data = await loadGenericCSV("assets/csv_list/choice_event.csv");
  if (data.isEmpty) return;
  choiceEventList.assignAll(data.skip(1).map((row) => {
    'id': row[0],
    'title': row[1],
    'description': row[2],
    'choiceAText': row[3],
    'choiceAEffect': row[4],
    'choiceBText': row[5],
    'choiceBEffect': row[6],
  }).toList());
}

Future<void> loadPositiveEvent() async {
  final data = await loadGenericCSV("assets/csv_list/positive_event.csv");
  if (data.isEmpty) return;
  positiveEventList.assignAll(data.skip(1).map((row) => {
    'id': row[0],
    'title': row[1],
    'description': row[2],
    'popupEffectString': row[3],
  }).toList());
}

Future<void> loadActivity() async {
  final data = await loadGenericCSV("assets/csv_list/activity_list.csv");
  if (data.isEmpty) return;
  final rows = data.skip(1);
  activityList.assignAll(rows.map((row) => {
    'id': row[0],
    'imageUrl': row[1],
    'title': row[2],
    'subtitle': row[3],
    'description': row[4],
    'price': row[5],
    'effect': row[6],
    'deductBalance': row[7],
  }).toList());
}

Future<void> loadAsset() async {
  final data = await loadGenericCSV("assets/csv_list/asset_list.csv");
  if (data.isEmpty) return;
  final rows = data.skip(1);
  assetList.assignAll(rows.map((row) => AssetModel(
    id: row[0],
    imageUrl: row[1],
    title: row[2],
    subtitle: row[3],
    description: row[4],
    price: int.tryParse(row[5].toString()) ?? 0,
  )).toList());
}

Future<void> loadJob() async {
  final data = await loadGenericCSV("assets/csv_list/job_list.csv");
  if (data.isEmpty) return;
  final rows = data.skip(1);
  jobList.assignAll(rows.map((row) => JobModel(
    id: row[0],
    imageUrl: "assets/images/jobs/${row[1]}.png",
    title: row[2].toString(),
    subtitle: row[3].toString(),
    description: row[4].toString(),
    salary: int.tryParse(row[5].toString()) ?? 0,
  )).toList());
}

Future<void> loadDataTable() async {
  final data = await loadGenericCSV("assets/csv_list/data_tables.csv");
  if (data.isEmpty) return;
  final rows = data.skip(1);

  List<String> fNames = [], lNames = [], imgMan = [], imgWoman = [], imgBoy = [], imgGirl = [], occ = [];

  for (var row in rows) {
    if (row.length > 1 && row[1]?.toString().isNotEmpty == true) fNames.add(row[1].toString());
    if (row.length > 2 && row[2]?.toString().isNotEmpty == true) lNames.add(row[2].toString());
    if (row.length > 3 && row[3]?.toString().isNotEmpty == true) imgMan.add(row[3].toString());
    if (row.length > 4 && row[4]?.toString().isNotEmpty == true) imgWoman.add(row[4].toString());
    if (row.length > 5 && row[5]?.toString().isNotEmpty == true) imgBoy.add(row[5].toString());
    if (row.length > 6 && row[6]?.toString().isNotEmpty == true) imgGirl.add(row[6].toString());
    if (row.length > 7 && row[7]?.toString().isNotEmpty == true) occ.add(row[7].toString());
  }

  firstNamesList.assignAll(fNames);
  lastNamesList.assignAll(lNames);
  imgUrlManList.assignAll(imgMan);
  imgUrlWomanList.assignAll(imgWoman);
  imgUrlBoyList.assignAll(imgBoy);
  imgUrlGirlList.assignAll(imgGirl);
  occupationsList.assignAll(occ);
}

Map<String, dynamic> getRandomProfile() {
  final int minAge = 17;
  final int maxAge = 40;

  String randomFirstName = firstNamesList[Random().nextInt(firstNamesList.length)];
  String randomLastName = lastNamesList[Random().nextInt(lastNamesList.length)];
  int randomAgeForParents = minAge + Random().nextInt(maxAge - minAge + 1);  // Generates a number between 17 and 40
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

// To parse and load all the CSV files
List<List<dynamic>> _parseCsv(String rawData) {
  return const CsvToListConverter(eol: '\n', shouldParseNumbers: true).convert(rawData);
}

Future<List<List<dynamic>>> loadGenericCSV(String path) async {
  try {
    final rawData = await rootBundle.loadString(path);
    // used compute() to load the task in a secondary thread
    return await compute(_parseCsv, rawData);
  } catch (e) {
    debugPrint("Error loading CSV ($path): $e");
    return [];
  }
}