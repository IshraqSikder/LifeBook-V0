import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:life_book/controllers/session_controller.dart';
import 'package:life_book/views/home/home_new.dart';
import 'package:life_book/views/start/create_new.dart';
import 'package:life_book/views/start/start_new.dart';
import 'package:life_book/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  runApp(const LifeBook());
}

class LifeBook extends StatelessWidget {
  const LifeBook({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final SessionController controller = Get.put(
      SessionController(),
      permanent: true,
    );
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Life Book',
          theme: primaryTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: controller.sessionToken.value.isEmpty
              ? '/start'
              : '/home', // Set your initial route
          getPages: [
            // Define your named routes
            GetPage(name: '/start', page: () => const StartScreenNew()),
            GetPage(
              name: '/create',
              page: () => const CreateCharacterScreenNew(),
            ),
            // GetPage(name: '/tutorial', page: () => const TutorialScreenNew(p)),
            GetPage(name: '/home', page: () => const HomeScreenNew()),
          ],
        );
      },
    );
  }
}
