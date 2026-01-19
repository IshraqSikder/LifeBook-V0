import 'package:flutter/material.dart';
import 'package:life_book/theme.dart';
import 'package:get/get.dart';

import '../../services/csv_services.dart';
import '../../services/asset_service.dart';
import '../../services/job_service.dart';
import '../../services/user_service.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _initApp();
  }

  Future<void> _initApp() async {
    await Future.wait([
      loadAgePopup(),
      loadPositiveEvent(),
      loadChoiceEvent(),
      loadActivity(),
      loadAsset(),
      loadJob(),
      loadDataTable(),
    ]);

    await Get.putAsync(() => UserService().init(), permanent: true);
    await Get.putAsync(() => AssetService().init(), permanent: true);
    await Get.putAsync(() => JobService().init(), permanent: true);

    await Future.delayed(const Duration(milliseconds: 300));

    final userService = Get.find<UserService>();
    if (userService.activeUser == null) {
      Get.offAllNamed('/start');
    } else {
      Get.offAllNamed('/home');
    }
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: AppColors.redColor,
      body: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}