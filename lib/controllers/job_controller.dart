import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_book/controllers/custom_animation_controller.dart';
import 'package:life_book/controllers/sound_service.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/views/jobs/job_details_popup.dart';
import 'package:life_book/models/job_model.dart';
import 'package:life_book/views/jobs/job_popup.dart';
import 'package:life_book/services/job_service.dart';

class JobController extends GetxController {
  final User player;

  JobController({required this.player});

  late final Rx<JobModel?> currentJob;
  late final RxList<JobModel> availableJobItems;

  final UserService userService = Get.find<UserService>();
  final JobService jobService = Get.find<JobService>();

  @override
  void onInit() {
    super.onInit();
    currentJob = jobService.currentJob;
    availableJobItems = jobService.availableJobs;
  }

  void applyForJob(JobModel jobItem) async {
    if (currentJob.value == null) {
      await jobService.applyForNewJob(jobItem);
      player.gameStats.balanceRx += jobItem.salary;

      topToCenterAnimationPopup(JobPopup(item: jobItem), true);

    } else {
      topToCenterAnimationPopup(alreadyApplyJob(), true);
    }

    Get.find<SoundService>().eventSound();

    player.userInfo.job = jobItem;
    userService.saveUser(player);
  }

  void resignJob() async {
    final JobModel? jobToResign = currentJob.value;
    if (jobToResign != null) {
      await jobService.resignCurrentJob();
      Get.find<SoundService>().singleKeyPress();
    }

    player.userInfo.job = null;
    userService.saveUser(player);
    Get.back();
  }

  // Method to handle showing a job detail popup or similar
  void handleJobTap(BuildContext context, JobModel item) {
    if (currentJob.value == item) {
      showJobDetailsPopup(context, item);
      Get.find<SoundService>().saberCut();
    } else if (availableJobItems.contains(item)) {
      applyForJob(item);
    }
  }

  // Function to show the job details popup
  void showJobDetailsPopup(BuildContext context, JobModel item) {
    topToCenterAnimationPopup(JobDetailsPopup(item: item), true);
  }
}
