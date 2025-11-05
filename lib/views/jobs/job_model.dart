import 'package:get/get.dart';
import 'package:hive/hive.dart';

part 'job_model.g.dart';

@HiveType(typeId: 5)
class JobItem extends HiveObject {
  @HiveField(0)
  final String imageUrl;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String subtitle;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final int salary;

  JobItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.salary,
  });
}

RxList<JobItem> initialAvailableJobItems = [
  JobItem(
    imageUrl: "assets/images/jobs/trooper.png",
    title: "Trooper",
    subtitle: "Police Department",
    description:
        "Patrols assigned areas, responds to emergencies, and enforces laws as a police trooper.",
    salary: 48951,
  ),
  JobItem(
    imageUrl: "assets/images/jobs/editor.png",
    title: "Jr. Editor",
    subtitle: "Newspaper",
    description:
        "Assists with proofreading, editing, and fact-checking articles for a newspaper publication.",
    salary: 47603,
  ),
  JobItem(
    imageUrl: "assets/images/jobs/therapist.png",
    title: "Jr. Therapist",
    subtitle: "Medical Office",
    description:
        "Provides support in therapeutic sessions and assists with patient care under supervision.",
    salary: 46627,
  ),
  JobItem(
    imageUrl: "assets/images/jobs/pilot_trainee.png",
    title: "Pilot Trainee",
    subtitle: "Airline",
    description:
        "Undergoes rigorous training to become a commercial airline pilot, learning flight operations and safety protocols.",
    salary: 45935,
  ),
  JobItem(
    imageUrl: "assets/images/jobs/analyst.png",
    title: "Jr. Analyst",
    subtitle: "Corporate",
    description:
        "Collects and analyzes data to support business decisions and strategy development in a corporate environment.",
    salary: 43935,
  ),
  JobItem(
    imageUrl: "assets/images/jobs/accountant.png",
    title: "Jr. Accountant",
    subtitle: "Corporate",
    description:
        "Assists with financial record-keeping, reconciliation, and preparation of financial statements.",
    salary: 48951,
  ),
  JobItem(
    imageUrl: "assets/images/jobs/chiropractor.png",
    title: "Jr. Chiropractor",
    subtitle: "Medical Office",
    description:
        "Provides chiropractic care and assists in patient treatment plans under the guidance of a senior practitioner.",
    salary: 48951,
  ),
  JobItem(
    imageUrl: "assets/images/jobs/microbiologist.png",
    title: "Microbiologist",
    subtitle: "Engineering Firm",
    description:
        "Researches and studies microorganisms for applications in an engineering context, such as environmental solutions.",
    salary: 38411,
  ),
].obs;
