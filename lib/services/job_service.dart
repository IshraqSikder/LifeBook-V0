import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'package:life_book/models/job_model.dart';

import 'CSV_services.dart';

class JobService extends GetxService {
  static const String _jobBoxName = 'jobItemsBox';
  static const String _currentJobBoxName = 'currentJobModelBox';

  late Box<JobModel> _jobBox;
  late Box<JobModel> _currentJobBox;

  final RxList<JobModel> _availableJobs = <JobModel>[].obs;
  RxList<JobModel> get availableJobs => _availableJobs;

  final Rx<JobModel?> _currentJob = Rx<JobModel?>(null);
  Rx<JobModel?> get currentJob => _currentJob;

  @override
  Future<void> onInit() async {
    super.onInit();
    _jobBox = await Hive.openBox<JobModel>(_jobBoxName);
    _currentJobBox = await Hive.openBox<JobModel>(_currentJobBoxName);

    if (_jobBox.isEmpty) {
      if (jobList.isNotEmpty) {
        for (var item in jobList) {
          await _jobBox.add(item);
        }
      }
    }
    _availableJobs.assignAll(_jobBox.values.toList());

    if (_currentJobBox.isNotEmpty) {
      _currentJob.value = _currentJobBox.values.first;
    }
  }

  Future<void> applyForNewJob(JobModel jobItem) async {
    if (_currentJob.value != null) {
      return;
    }

    await removeJobFromAvailable(jobItem); // remove from jobBox and list
    await _currentJobBox.clear();
    await _currentJobBox.add(jobItem);
    _currentJob.value = jobItem;
  }

  Future<void> resignCurrentJob() async {
    final JobModel? jobToResign = _currentJob.value;

    if (jobToResign == null) {
      return;
    }

    await _currentJobBox.clear();
    _currentJob.value = null;

    await addJobToAvailable(jobToResign); // add to jobBox and list
  }

  Future<void> addJobToAvailable(JobModel jobItem) async {
    await _jobBox.add(jobItem);
    _availableJobs.add(jobItem);
  }

  Future<void> removeJobFromAvailable(JobModel jobItem) async {
    dynamic jobKey;
    for (var key in _jobBox.keys) {
      final item = _jobBox.get(key);
      if (item?.title == jobItem.title) {
        jobKey = key;
        break;
      }
    }
    if (jobKey != null) {
      await _jobBox.delete(jobKey);
    }
    _availableJobs.remove(jobItem);
  }

  Future<void> clearAllJobData() async {
    await _jobBox.clear();
    await _currentJobBox.clear();

    if (_jobBox.isEmpty && jobList.isNotEmpty) {
      for (var item in jobList) {
        await _jobBox.add(item);
      }
    }
    _availableJobs.assignAll(_jobBox.values.toList());
    _currentJob.value = null;
  }
}
