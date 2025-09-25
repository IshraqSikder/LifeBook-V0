mixin Stats {
  final Map<String, int> _stats = {
    "Happiness": 50,
    "Health": 50,
    "Smarts": 50,
    "Looks": 50,
  };

  int get happiness => _stats["Happiness"] ?? 0;
  int get health => _stats["Health"] ?? 0;
  int get smarts => _stats["Smarts"] ?? 0;
  int get looks => _stats["Looks"] ?? 0;

  // A getter to expose the stats map for iteration
  Map<String, int> get allStats => _stats;

  // methods
  // void updateStat(double currentValue, double changeValue) {
  //   double newValue = (currentValue + changeValue).clamp(0, 100);

  //   if (newValue == currentValue) return;
  //   switch (currentValue) {
  //     case double hp when hp == _happiness:
  //       _happiness = newValue;
  //       break;
  //     case double hl when hl == _health:
  //       _health = newValue;
  //       break;
  //     case double sm when sm == _smarts:
  //       _smarts = newValue;
  //       break;
  //     case double lk when lk == _looks:
  //       _looks = newValue;
  //       break;
  //   }
  // }
}
