import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_book/services/user.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/views/jobs/job_details_popup.dart';
import 'package:life_book/views/jobs/job_model.dart';
import 'package:life_book/views/jobs/job_popup.dart';
import 'package:life_book/views/jobs/job_service.dart';

class JobController extends GetxController {
  JobController({required this.player});

  final User player;

  final RxList<JobItem> currentJobs = <JobItem>[].obs;
  final RxList<JobItem> availableJobItems = <JobItem>[].obs;

  final UserService userService = Get.find<UserService>();
  final JobService jobService = Get.find<JobService>();

  @override
  void onInit() {
    super.onInit();
    // Initialize available jobs from the global list
    // availableJobItems.addAll(initialAvailableJobItems);
    availableJobItems.addAll(jobService.availableJobs);
  }

  void applyForJob(JobItem jobItem) {
    if (currentJobs.isEmpty) {
      currentJobs.add(jobItem);
      availableJobItems.remove(jobItem);
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

    // player.userInfo.job.addAll(currentJobs);
    userService.saveUser(player);
  }

  void resignJob(JobItem jobItem) {
    currentJobs.remove(jobItem);
    availableJobItems.add(jobItem);

    Get.back();
  }

  // Method to handle showing a job detail popup or similar
  void handleJobTap(BuildContext context, JobItem item) {
    if (currentJobs.contains(item)) {
      showJobDetailsPopup(context, item);
    } else if (availableJobItems.contains(item)) {
      applyForJob(item);
    }
  }

  // Function to show the profile popup
  void showJobDetailsPopup(BuildContext context, JobItem item) {
    Get.dialog(
      JobDetailsPopup(item: item),
      barrierDismissible: true,
      barrierColor: Colors.black54.withValues(alpha: 0.90),
    ).then((value) {
      Get.delete<JobController>(); // Clean up the controller
    });
  }
}
