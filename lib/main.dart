import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:life_book/models/asset_model.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/services/user_service.dart';
import 'package:life_book/views/home/home_screen.dart';
import 'package:life_book/models/job_model.dart';
import 'package:life_book/views/start/create_screen.dart';
import 'package:life_book/views/start/splash_screen.dart';
import 'package:life_book/views/start/start_screen.dart';
import 'package:life_book/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // This hides the bars and makes them appear only when you swipe from the edge
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // Initialize Hive
  await Hive.initFlutter();

  // Register Adapters safely
  if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(UserInfoAdapter());
  if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(RelationshipAdapter());
  if (!Hive.isAdapterRegistered(2)) Hive.registerAdapter(GameStatsAdapter());
  if (!Hive.isAdapterRegistered(3)) Hive.registerAdapter(LevelAdapter());
  if (!Hive.isAdapterRegistered(4)) Hive.registerAdapter(UserAdapter());
  if (!Hive.isAdapterRegistered(5)) Hive.registerAdapter(CoreStatsAdapter());
  if (!Hive.isAdapterRegistered(6)) Hive.registerAdapter(JobModelAdapter());
  if (!Hive.isAdapterRegistered(7)) Hive.registerAdapter(AssetModelAdapter());

  // await Hive.deleteBoxFromDisk('usersBox');

  runApp(const LifeBook());
}

class LifeBook extends StatelessWidget {
  const LifeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: primaryTheme,
          initialRoute: '/splash',
          getPages: [
            GetPage(name: '/splash', page: () => const SplashScreen()),
            GetPage(name: '/start', page: () => const StartScreen()),
            GetPage(name: '/create', page: () => const CreateCharacterScreen()),
            GetPage(name: '/home', page: () => HomeScreen(player: Get.find<UserService>().activeUser!)),
          ],
        );
      },
    );
  }
}