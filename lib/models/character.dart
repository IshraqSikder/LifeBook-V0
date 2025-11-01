import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:life_book/models/stats.dart';

@HiveType(typeId: 0) // New: Add HiveType annotation
class Character with Stats {
  @HiveField(0) // New: Add HiveField annotation
  RxInt _age = 0.obs;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String gender;

  @HiveField(3)
  final RxInt _balance = 0.obs;

  Character({required this.name, required this.gender});

  RxInt get age => _age;
  RxInt get balance => _balance;

  void incrementAge() {
    _age++;
  }

  // factory Character.fromJson(Map<String, dynamic> json) => Character(
  //   name: json["name"],
  //   gender: json["gender"],
  // );

  // Map<String, dynamic> toJson() => {
  //   "name": name,
  //   "gender": gender,
  // };
}
