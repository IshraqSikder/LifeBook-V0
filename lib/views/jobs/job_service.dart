import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/views/jobs/job_model.dart';

class JobService extends GetxService {
  static const String _jobBoxName = 'jobItemsBox';
  static const String _currentJobBoxName = 'currentJobItemBox';

  late Box<JobItem> _jobBox;
  late Box<JobItem> _currentJobBox;

  final RxList<JobItem> _availableJobs = <JobItem>[].obs;
  RxList<JobItem> get availableJobs => _availableJobs;

  final Rx<JobItem?> _currentJob = Rx<JobItem?>(null);
  Rx<JobItem?> get currentJob => _currentJob;

  @override
  Future<void> onInit() async {
    super.onInit();
    _jobBox = await Hive.openBox<JobItem>(_jobBoxName);
    _currentJobBox = await Hive.openBox<JobItem>(_currentJobBoxName);

    if (_jobBox.isEmpty) {
      for (var item in initialAvailableJobItems) {
        await _jobBox.add(item);
      }
    }
    _availableJobs.assignAll(_jobBox.values.toList());

    if (_currentJobBox.isNotEmpty) {
      _currentJob.value = _currentJobBox.values.first;
    }
  }

  Future<void> applyForNewJob(JobItem jobItem) async {
    if (_currentJob.value != null) {
      return;
    }

    await removeJobFromAvailable(jobItem); // remove from jobBox and list
    await _currentJobBox.clear();
    await _currentJobBox.add(jobItem);
    _currentJob.value = jobItem;
  }

  Future<void> resignCurrentJob() async {
    final JobItem? jobToResign = _currentJob.value;

    if (jobToResign == null) {
      return;
    }

    await _currentJobBox.clear();
    _currentJob.value = null;

    await addJobToAvailable(jobToResign); // add to jobBox and list
  }

  Future<void> addJobToAvailable(JobItem jobItem) async {
    await _jobBox.add(jobItem);
    _availableJobs.add(jobItem);
  }

  Future<void> removeJobFromAvailable(JobItem jobItem) async {
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

    if (_jobBox.isEmpty) {
      for (var item in initialAvailableJobItems) {
        await _jobBox.add(item);
      }
    }
    _availableJobs.assignAll(_jobBox.values.toList());
    _currentJob.value = null;
  }
}
