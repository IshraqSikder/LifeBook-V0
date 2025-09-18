import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_book/screens/home/home.dart';
import 'package:life_book/screens/start/start.dart';
import 'package:life_book/theme.dart';

void main() {
  runApp(const LifeBook());
}

class LifeBook extends StatelessWidget {
  const LifeBook({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          title: 'Life Book',
          theme: primaryTheme,
          debugShowCheckedModeBanner: false,
          home: StartScreen(),
        );
      },
    );
  }
}
