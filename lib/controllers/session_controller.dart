import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class SessionController extends GetxController {
  RxString sessionToken = ''.obs; // Use RxString for reactivity

  void generateSessionToken() {
    var uuid = Uuid();
    sessionToken.value = uuid.v4();
    print('Generated Session Token: ${sessionToken.value}'); // For debugging
  }

  // You might also want a way to clear the token when the session ends
  void clearToken() {
    sessionToken.value = '';
  }
}
