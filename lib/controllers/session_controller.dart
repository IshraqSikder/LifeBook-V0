// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:uuid/uuid.dart';

// class SessionController extends GetxController {
//   RxString sessionToken = ''.obs; // Use RxString for reactivity

//   @override
//   void onInit() async {
//     super.onInit();
//     // var sessionBox = await Hive.openBox('sessionBox');
//     // String? storedToken = sessionBox.get('sessionToken');
//     // if (storedToken != null) {
//     //   sessionToken.value = storedToken;
//     //   print('Loaded Session Token: $storedToken'); // For debugging
//     // }
//   }

//   void generateSessionToken() {
//     var uuid = Uuid();
//     sessionToken.value = uuid.v4();
//     print('Generated Session Token: ${sessionToken.value}'); // For debugging
//   }

//   // You might also want a way to clear the token when the session ends
//   void clearToken() {
//     sessionToken.value = '';
//   }
// }
