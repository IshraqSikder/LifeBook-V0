import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_book/models/character.dart';
import 'package:life_book/screens/appbar/appbar.dart';
import 'package:life_book/screens/home/bottom_navbar.dart';
import 'package:life_book/screens/home/life_story.dart';
import 'package:life_book/screens/home/profile_header.dart';
import 'package:life_book/screens/home/stats_new.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          ProfileHeader(player: Character()),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10.h,
                  children: [
                    LifeStory(
                      13,
                      "My whole life felt like it was defined by my name. Slaughter. On the football field, that’s who I was. From a kid in Colorado to a champion at Alabama and then a superstar for the Chicago Bears, my life was a highlight reel of hard hits and roaring crowds, I earned the massive contracts, won the Super Bowl, and lived the celebrity life for a while. I thought that was everything.",
                    ),
                    LifeStory(
                      14,
                      "My whole life felt like it was defined by my name. Slaughter. On the football field, that’s who I was. From a kid in Colorado to a champion at Alabama and then a superstar for the Chicago Bears, my life was a highlight reel of hard hits and roaring crowds, I earned the massive contracts, won the Super Bowl, and lived the celebrity life for a while. I thought that was everything.",
                    ),
                    LifeStory(
                      15,
                      "My whole life felt like it was defined by my name. Slaughter. On the football field, that’s who I was. From a kid in Colorado to a champion at Alabama and then a superstar for the Chicago Bears, my life was a highlight reel of hard hits and roaring crowds, I earned the massive contracts, won the Super Bowl, and lived the celebrity life for a while. I thought that was everything.",
                    ),
                    LifeStory(
                      16,
                      "My whole life felt like it was defined by my name. Slaughter. On the football field, that’s who I was. From a kid in Colorado to a champion at Alabama and then a superstar for the Chicago Bears, my life was a highlight reel of hard hits and roaring crowds, I earned the massive contracts, won the Super Bowl, and lived the celebrity life for a while. I thought that was everything.",
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomNavBar(player: Character()),
          StatsNew(),
        ],
      ),
    );
  }
}
