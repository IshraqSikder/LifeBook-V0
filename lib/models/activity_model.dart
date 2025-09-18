class ActivityItem {
  final String imageUrl;
  final String title;
  final String subtitle;
  final int price;

  ActivityItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
  });
}

List<ActivityItem> activityItems = [
  ActivityItem(
    imageUrl: "assets/images/activities/book.png",
    title: "Read A Book",
    price: 250,
    subtitle: "Find a good book and read it (\$250)",
  ),
  ActivityItem(
    imageUrl: "assets/images/activities/movie.png",
    title: "Watch A Movie",
    price: 550,
    subtitle: "Go see a movie (\$550)",
  ),
  ActivityItem(
    imageUrl: "assets/images/activities/gym.png",
    title: "Go To The Gym",
    price: 350,
    subtitle: "Work out at the gym (\$350)",
  ),
  ActivityItem(
    imageUrl: "assets/images/activities/skincare.png",
    title: "Do Skin Care",
    price: 150,
    subtitle: "Take time for yourself (\$150)",
  ),
];
