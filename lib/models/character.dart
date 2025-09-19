import 'dart:developer';

import 'package:life_book/models/stats.dart';

class Character with Stats {
  int _age = 0;
  final String name;
  final String gender;

  Character({required this.name, required this.gender});

  int get age => _age;

  void incrementAge() {
    _age++;
    // final random = Random();
    // // Generate random changes between -5 and 5
    // updateStat(happiness, random.nextDouble() * 0.1 - 0.05);
    // updateStat(health, random.nextDouble() * 0.1 - 0.05);
    // updateStat(smarts, random.nextDouble() * 0.1 - 0.05);
    // updateStat(looks, random.nextDouble() * 0.1 - 0.05);
  }
}
