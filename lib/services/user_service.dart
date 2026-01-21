import 'package:hive_flutter/hive_flutter.dart';
import 'package:life_book/models/user.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  static const String _userBoxName = 'usersBox';
  static const String _sessionBoxName = 'sessionBox';

  late Box<User> _userBox;
  late Box _sessionBox;

  final Rx<User?> _activeUser = Rx<User?>(null);
  User? get activeUser => _activeUser.value;

  // 2. Create a dedicated init method
  Future<UserService> init() async {
    _userBox = await Hive.openBox<User>(_userBoxName);
    _sessionBox = await Hive.openBox(_sessionBoxName);

    final int? activeUserId = _sessionBox.get('activeUserId');
    if (activeUserId != null) {
      _activeUser.value = _userBox.get(activeUserId);
    }

    // Return this instance so Get.putAsync can use it
    return this;
  }

  Future<void> saveUser(User user) async {
    await _userBox.put(user.userInfo.id, user);
    await setActiveUser(user.userInfo.id); // Set as active user upon saving
  }

  User? getUser(int id) {
    return _userBox.get(id);
  }

  Future<void> setActiveUser(int userId) async {
    await _sessionBox.put('activeUserId', userId);
    _activeUser.value = _userBox.get(userId);
  }

  int generateUniqueId() {
    // This line is safe because onInit (and thus box opening) is awaited by Get.putAsync
    if (_userBox.isEmpty) {
      return 1;
    }
    int maxId = 0;
    for (var key in _userBox.keys) {
      if (key is int && key > maxId) {
        maxId = key;
      }
    }
    return maxId + 1;
  }

  Future<void> clearActiveUser() async {
    await _sessionBox.delete('activeUserId');
    _activeUser.value = null;
  }

  Future<void> clearAllUsersData() async {
    await _userBox.clear();
    await clearActiveUser();
  }
}
