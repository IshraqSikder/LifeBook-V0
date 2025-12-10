import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:life_book/models/asset_model.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/services/asset_service.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/views/home/home.dart';
import 'package:life_book/views/jobs/job_model.dart';
import 'package:life_book/views/jobs/job_service.dart';
import 'package:life_book/views/start/create_new.dart';
import 'package:life_book/views/start/start_new.dart';
import 'package:life_book/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register your adapters here
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(UserInfoAdapter());
  Hive.registerAdapter(RelationshipAdapter());
  Hive.registerAdapter(GameStatsAdapter());
  Hive.registerAdapter(LevelAdapter());
  Hive.registerAdapter(JobItemAdapter());
  Hive.registerAdapter(AssetModelAdapter());

  // await Hive.deleteBoxFromDisk('usersBox');

  await Get.putAsync<UserService>(() async {
    final userService = UserService();
    await userService.onInit(); // Explicitly await onInit here
    return userService;
  }, permanent: true);

  await Get.putAsync<JobService>(() async {
    final jobService = JobService();
    await jobService.onInit(); // Explicitly await onInit here
    return jobService;
  }, permanent: true);

  await Get.putAsync<AssetService>(() async {
    final assetService = AssetService();
    await assetService.onInit(); // Explicitly await onInit here
    return assetService;
  }, permanent: true);

  runApp(const LifeBook());
}

class LifeBook extends StatelessWidget {
  const LifeBook({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final UserService userService = Get.find<UserService>();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return Obx(() {
          final String initialRoute = userService.activeUser == null
              ? '/start'
              : '/home';

          return GetMaterialApp(
            title: 'Life Book',
            theme: primaryTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: initialRoute,
            getPages: [
              GetPage(name: '/start', page: () => const StartScreenNew()),
              GetPage(
                name: '/create',
                page: () => const CreateCharacterScreenNew(),
              ),
              // GetPage(name: '/tutorial', page: () => const TutorialScreenNew(p)),
              GetPage(
                name: '/home',
                page: () => HomeScreenNew(player: userService.activeUser!),
              ),
            ],
          );
        });
      },
    );
  }
}
