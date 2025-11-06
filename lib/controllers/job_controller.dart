import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_book/services/user.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/views/jobs/job_details_popup.dart';
import 'package:life_book/views/jobs/job_model.dart';
import 'package:life_book/views/jobs/job_popup.dart';
import 'package:life_book/views/jobs/job_service.dart';

class JobController extends GetxController {
  final User player;

  JobController({required this.player});

  late final Rx<JobItem?> currentJob;
  late final RxList<JobItem> availableJobItems;

  final UserService userService = Get.find<UserService>();
  final JobService jobService = Get.find<JobService>();

  @override
  void onInit() {
    super.onInit();
    currentJob = jobService.currentJob;
    availableJobItems = jobService.availableJobs;
  }

  void applyForJob(JobItem jobItem) async {
    if (currentJob.value == null) {
      await jobService.applyForNewJob(jobItem);
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

    player.userInfo.job = jobItem;
    userService.saveUser(player);
  }

  void resignJob() async {
    final JobItem? jobToResign = currentJob.value;
    if (jobToResign != null) {
      await jobService.resignCurrentJob();
    }

    player.userInfo.job = null;
    userService.saveUser(player);
    Get.back();
  }

  // Method to handle showing a job detail popup or similar
  void handleJobTap(BuildContext context, JobItem item) {
    if (currentJob.value == item) {
      showJobDetailsPopup(context, item);
    } else if (availableJobItems.contains(item)) {
      applyForJob(item);
    }
  }

  // Function to show the job details popup
  void showJobDetailsPopup(BuildContext context, JobItem item) {
    Get.dialog(
      JobDetailsPopup(item: item),
      barrierDismissible: true,
      barrierColor: Colors.black54.withValues(alpha: 0.90),
    );
  }
}
