import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

Future<List<List<dynamic>>> loadAgePopupCSV() async {
  final rawData = await rootBundle.loadString("assets/csv_list/age_popup.csv");
  final List<List<dynamic>> listData = const CsvToListConverter(
    eol: '\n',
  ).convert(rawData);
  return listData;
}

Future<List<List<dynamic>>> loadChoiceEventCSV() async {
  final rawData = await rootBundle.loadString(
    "assets/csv_list/choice_event.csv",
  );
  final List<List<dynamic>> listData = const CsvToListConverter(
    eol: '\n',
  ).convert(rawData);
  return listData;
}

Future<List<List<dynamic>>> loadPositiveEventCSV() async {
  final rawData = await rootBundle.loadString(
    "assets/csv_list/positive_event.csv",
  );
  final List<List<dynamic>> listData = const CsvToListConverter(
    eol: '\n',
  ).convert(rawData);
  return listData;
}

Future<List<List<dynamic>>> loadActivityCSV() async {
  final rawData = await rootBundle.loadString(
    "assets/csv_list/activity_list.csv",
  );
  final List<List<dynamic>> listData = const CsvToListConverter(
    eol: '\n',
  ).convert(rawData);
  return listData;
}

Future<List<List<dynamic>>> loadAssetCSV() async {
  final rawData = await rootBundle.loadString("assets/csv_list/asset_list.csv");
  final List<List<dynamic>> listData = const CsvToListConverter(
    eol: '\n',
  ).convert(rawData);
  return listData;
}
