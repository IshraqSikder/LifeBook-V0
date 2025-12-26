import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:life_book/models/asset_model.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/services/CSV_services.dart';
import 'package:life_book/services/asset_service.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/views/home/home_screen.dart';
import 'package:life_book/models/job_model.dart';
import 'package:life_book/services/job_service.dart';
import 'package:life_book/views/start/create_screen.dart';
import 'package:life_book/views/start/start_screen.dart';
import 'package:life_book/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // This hides the bars and makes them appear only when you swipe from the edge
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // This ensures that when they DO appear, or during transitions, there is no black background
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
  ));

  // Initialize Hive
  await Hive.initFlutter();

  // Register your adapters here
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(UserInfoAdapter());
  Hive.registerAdapter(RelationshipAdapter());
  Hive.registerAdapter(GameStatsAdapter());
  Hive.registerAdapter(LevelAdapter());
  Hive.registerAdapter(AssetModelAdapter());
  Hive.registerAdapter(JobModelAdapter());

  // await Hive.deleteBoxFromDisk('usersBox');

  // load data from CSV Services
  await loadAgePopup();
  await loadPositiveEvent();
  await loadChoiceEvent();
  await loadActivity();
  await loadAsset();
  await loadJob();

  await loadElderSiblings();
  await loadDataTable();

  // load data from Hive
  await Get.putAsync<UserService>(() async {
    final userService = UserService();
    await userService.init(); // Explicitly await init here
    return userService;
  }, permanent: true);

  await Get.putAsync<AssetService>(() async {
    final assetService = AssetService();
    await assetService.init(); // Explicitly await init here
    return assetService;
  }, permanent: true);

  await Get.putAsync<JobService>(() async {
    final jobService = JobService();
    await jobService.init(); // Explicitly await init here
    return jobService;
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
              GetPage(name: '/start', page: () => const StartScreen()),
              GetPage(
                name: '/create',
                page: () => const CreateCharacterScreen(),
              ),
              // GetPage(name: '/tutorial', page: () => const TutorialScreen(p)),
              GetPage(
                name: '/home',
                page: () => HomeScreen(player: userService.activeUser!),
              ),
            ],
          );
        });
      },
    );
  }
}
