// import 'dart:convert';

// import 'package:life_book/models/character.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LocalService {
//   Future<void> storeUser(Character user) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     String userJson = jsonEncode(user.toJson());
//     await preferences.setString("characterInfo", userJson);
//   }

//   Future<Character?> getUser() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     String? userJson = preferences.getString("characterInfo");
//     if (userJson == null) {
//       return null;
//     }
//     Map<String, dynamic> userMap = jsonDecode(userJson);
//     return Character.fromJson(userMap);
//   }
// }

// Structure

List<Map<String, dynamic>> users = [
  {
    "user_info": {
      "id": 1,
      "name": "random",
      "gender": "male",
      "realationships": [
        {"type": "parents", "relation": "father", "name": "random"},
        {"type": "parents", "relation": "mother", "name": "random"},
        {"type": "siblings", "relation": "sister", "name": "random"},
      ],
      "assets": [],
      "school": {},
      "job": {},
    },
    "game_stats": {
      "levels": [
        {
          "age": 0,
          "experience": ["You're now 0 years old", "You were born."],
        },
      ],
      "balance": 0,
      "happiness": 50,
      "health": 50,
      "smarts": 50,
      "looks": 50,
    },
  },
];
