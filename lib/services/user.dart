import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:life_book/views/jobs/job_model.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class UserInfo extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String gender;
  @HiveField(3)
  Map<String, dynamic> school;
  @HiveField(4)
  JobItem? job;
  @HiveField(5)
  List<dynamic> assets;
  @HiveField(6)
  List<Relationship> relationships;
  @HiveField(7)
  List<Relationship> activities;

  UserInfo({
    required this.id,
    required this.name,
    required this.gender,
    required this.school,
    this.job,
    required this.assets,
    required this.relationships,
    required this.activities,
  });
}

@HiveType(typeId: 1)
class Relationship extends HiveObject {
  @HiveField(0)
  String type;
  @HiveField(1)
  String relation;
  @HiveField(2)
  String name;

  Relationship({
    required this.type,
    required this.relation,
    required this.name,
  });
}

@HiveType(typeId: 2)
class GameStats extends HiveObject {
  @HiveField(0)
  List<Level> levels;
  @HiveField(1)
  int balance;
  @HiveField(2)
  int happiness;
  @HiveField(3)
  int health;
  @HiveField(4)
  int smarts;
  @HiveField(5)
  int looks;

  late RxList<Level> levelsRx;
  late RxInt balanceRx;
  late RxInt happinessRx;
  late RxInt healthRx;
  late RxInt smartsRx;
  late RxInt looksRx;

  GameStats({
    required this.levels,
    required this.balance,
    required this.happiness,
    required this.health,
    required this.smarts,
    required this.looks,
  }) {
    // Initialize reactive variables from stored values
    levelsRx = levels.obs;
    balanceRx = balance.obs;
    happinessRx = happiness.obs;
    healthRx = health.obs;
    smartsRx = smarts.obs;
    looksRx = looks.obs;

    // Listen for changes in RxInts and update the backing int fields
    // This is crucial for syncing changes back to Hive.
    ever<List<Level>>(levelsRx, (newValue) => levels = newValue);
    ever(balanceRx, (newValue) => balance = newValue);
    ever(happinessRx, (newValue) => happiness = newValue);
    ever(healthRx, (newValue) => health = newValue);
    ever(smartsRx, (newValue) => smarts = newValue);
    ever(looksRx, (newValue) => looks = newValue);
  }

  Map<String, RxInt> get allStats => {
    "Happiness": happinessRx,
    "Health": healthRx,
    "Smarts": smartsRx,
    "Looks": looksRx,
  };
}

@HiveType(typeId: 3)
class Level extends HiveObject {
  @HiveField(0)
  int age;
  @HiveField(1)
  List<String> experience;

  late RxInt ageRx;

  Level({required this.age, required this.experience}) {
    ageRx = age.obs;

    // Listen for changes in ageRx and update the backing int field
    ever(ageRx, (newValue) => age = newValue);
  }

  void incrementAge() {
    // age++;
    ageRx.value++; // keep Hive value in sync
  }
}

@HiveType(typeId: 4)
class User extends HiveObject {
  @HiveField(0)
  UserInfo userInfo;
  @HiveField(1)
  GameStats gameStats;

  User({required this.userInfo, required this.gameStats});
}

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
