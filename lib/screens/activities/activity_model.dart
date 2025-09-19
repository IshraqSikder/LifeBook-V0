class ActivityItem {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;
  final int price;

  ActivityItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
  });
}

List<ActivityItem> activityItems = [
  ActivityItem(
    imageUrl: "assets/images/activities/book.png",
    title: "Read A Book",
    price: 250,
    subtitle: "Find a good book and read it (\$250)",
    description:
        "You read about simple strategies for building wealth and investing wisely. You feel more knowledgeable about managing your money.",
  ),
  ActivityItem(
    imageUrl: "assets/images/activities/movie.png",
    title: "Watch A Movie",
    price: 550,
    subtitle: "Go see a movie (\$550)",
    description:
        "You spent the entire movie laughing out loud at the ridiculous jokes and hilarious situations. Your mood has significantly improved.",
  ),
  ActivityItem(
    imageUrl: "assets/images/activities/gym.png",
    title: "Go To The Gym",
    price: 350,
    subtitle: "Work out at the gym (\$350)",
    description:
        "You focused on lifting heavy weights, pushing your muscles to their absolute limit. You can already feel the gains!",
  ),
  ActivityItem(
    imageUrl: "assets/images/activities/skincare.png",
    title: "Do Skin Care",
    price: 150,
    subtitle: "Take time for yourself (\$150)",
    description:
        "You did the essentials: cleanser, toner, and moisturizer. Your skin feels clean, fresh, and hydrated.",
  ),
];
