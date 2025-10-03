import 'dart:convert';

import 'package:life_book/models/character.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  Future<void> storeUser(Character user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    await preferences.setString("characterInfo", userJson);
  }

  Future<Character?> getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userJson = preferences.getString("characterInfo");
    if (userJson == null) {
      return null;
    }
    Map<String, dynamic> userMap = jsonDecode(userJson);
    return Character.fromJson(userMap);
  }
}
