import 'package:get/get.dart';
import 'package:hive/hive.dart'; // Import GetX for Rx types

mixin Stats {
  // Use RxInt for each stat to make them observable and mutable
  @HiveField(4)
  final RxInt _happiness = 50.obs;

  @HiveField(5)
  final RxInt _health = 50.obs;

  @HiveField(6)
  final RxInt _smarts = 50.obs;

  @HiveField(7)
  final RxInt _looks = 50.obs;

  // // Getters to expose the RxInt values
  // RxInt get happiness => _happiness;
  // RxInt get health => _health;
  // RxInt get smarts => _smarts;
  // RxInt get looks => _looks;

  Map<String, RxInt> get allStats => {
    "Happiness": _happiness,
    "Health": _health,
    "Smarts": _smarts,
    "Looks": _looks,
  };

  // Method to apply stat changes
  void applyStatChanges(Map<String, dynamic> changes) {
    changes.forEach((statName, value) {
      final RxInt? stat = allStats[statName];
      if (stat != null && value is int) {
        stat.value += value;
        // Optional: Clamp stats to a min/max range (e.g., 0-100)
        stat.value = stat.value.clamp(0, 100);
      }
    });
  }
}
