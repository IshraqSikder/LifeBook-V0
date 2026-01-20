import 'package:hive/hive.dart';

part 'job_model.g.dart';

@HiveType(typeId: 6)
class JobModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String imageUrl;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String subtitle;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final int salary;

  JobModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.salary,
  });
}
