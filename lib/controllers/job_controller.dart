import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_book/services/user.dart';
import 'package:life_book/views/jobs/job_model.dart';
import 'package:life_book/views/jobs/job_popup.dart';

class JobController extends GetxController {
  // final Character player;
  final User player;

  JobController({required this.player});

  final RxList<JobItem> currentJobs = <JobItem>[].obs;
  final RxList<JobItem> availableJobItems = <JobItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize available jobs from the global list
    availableJobItems.addAll(initialAvailableJobItems);
  }

  void applyForJob(JobItem jobItem) {
    if (currentJobs.isEmpty) {
      currentJobs.add(jobItem);
      availableJobItems.remove(jobItem);
      // player.balance.value += jobItem.salary;
      player.gameStats.balance += jobItem.salary;

      Get.dialog(
        barrierDismissible: true,
        barrierColor: Colors.black54.withValues(alpha: 0.95),
        JobPopup(player: player, item: jobItem),
      );
    } else {
      Get.dialog(
        barrierDismissible: true,
        barrierColor: Colors.black54.withValues(alpha: 0.95),
        alreadyApplyJob(),
      );
    }
  }

  void resignJob(JobItem jobItem) {
    currentJobs.remove(jobItem);
    availableJobItems.add(jobItem);

    Get.snackbar(
      'Resigned',
      'You resigned from ${jobItem.title}.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  // Method to handle showing a job detail popup or similar
  void handleJobTap(BuildContext context, JobItem item) {
    if (currentJobs.contains(item)) {
      resignJob(item);
    } else if (availableJobItems.contains(item)) {
      applyForJob(item);
    }
  }
}
