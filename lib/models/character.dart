import 'package:life_book/models/stats.dart';

class Character with Stats {
  int _age = 0;
  final String name;
  final String gender;

  Character({required this.name, required this.gender});

  int get age => _age;

  void incrementAge() {
    _age++;
  }

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    name: json["name"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "gender": gender,
  };
}
