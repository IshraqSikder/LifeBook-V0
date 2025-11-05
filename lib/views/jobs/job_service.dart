import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'package:life_book/views/jobs/job_model.dart'; // Import your JobItem model

class JobService extends GetxService {
  static const String _jobBoxName = 'jobItemsBox';
  late Box<JobItem> _jobBox;

  final RxList<JobItem> _availableJobs = <JobItem>[].obs;
  RxList<JobItem> get availableJobs => _availableJobs;

  final RxList<JobItem> _currentJobs = <JobItem>[].obs;
  RxList<JobItem> get currentJobs => _currentJobs;

  @override
  Future<void> onInit() async {
    super.onInit();
    _jobBox = await Hive.openBox<JobItem>(_jobBoxName);

    // Populate the box with initial data if it's empty
    if (_jobBox.isEmpty) {
      for (var item in initialAvailableJobItems) {
        await _jobBox.add(item); // Use .add() for auto-incrementing keys
      }
    }

    // Load all job items from Hive into the reactive list
    _availableJobs.assignAll(_jobBox.values.toList());
  }

  // Example: Add a new job
  Future<void> addJob(JobItem job) async {
    // await _jobBox.add(job);
    _availableJobs.remove(job);
    _currentJobs.add(job);
  }

  // Example: Get a job by its Hive key (if you used put/get with specific keys)
  // If you used .add() as above, keys are auto-generated ints.
  JobItem? getJob(int hiveKey) {
    return _jobBox.get(hiveKey);
  }

  // Example: Delete a job
  Future<void> deleteJob(JobItem job) async {
    await job.delete(); // If JobItem extends HiveObject, this works
    _availableJobs.remove(job); // Update the reactive list
  }

  // Example: Update a job (assuming you have a way to identify it)
  // This is trickier if using .add() with auto-generated keys.
  // If you want to update, you might need to iterate or save by a unique ID field.
  // For simplicity, if you fetch a JobItem, you can call .save() on it
  // if it extends HiveObject.
  // For example:
  // JobItem existingJob = _availableJobs.firstWhere((j) => j.title == "Trooper");
  // existingJob.salary = 50000;
  // await existingJob.save();
}
