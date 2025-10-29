// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:life_book/models/age_popup_list.dart';
// import 'package:life_book/models/character.dart';
// import 'package:life_book/screens/appbar/custom_appbar.dart';
// import 'package:life_book/screens/home/bottom_navbar.dart';
// import 'package:life_book/screens/home/life_story.dart';
// import 'package:life_book/screens/home/profile_header.dart';
// import 'package:life_book/screens/home/stats_section.dart';
// import 'package:life_book/screens/menu/menu_screen.dart';

// class HomeScreen extends StatefulWidget {
//   final Character? player;
//   final dynamic choice;
//   const HomeScreen({super.key, this.player, this.choice});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isMenuToggled = false;
//   final List<LifeStory> _lifeStoryDiaryEntries = [
//     LifeStory(age: 0, description: "You're now 0 years old!"),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         player: widget.player!,
//         onMenuToggle: (value) {
//           setState(() {
//             // Update any state if needed when menu is toggled
//             isMenuToggled = !isMenuToggled;
//           });
//         },
//       ),
//       body: isMenuToggled
//           ? MenuScreen(player: widget.player!)
//           : Column(
//               children: [
//                 ProfileHeader(player: widget.player!),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Container(
//                       width: double.infinity,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 20.w,
//                         vertical: 10.h,
//                       ),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         spacing: 10.h,
//                         children: [
//                           // List of life story entries
//                           ..._lifeStoryDiaryEntries.map((entry) {
//                             return Column(
//                               children: [
//                                 if (agePopupList.containsKey(entry.age))
//                                   LifeStory(
//                                     age: entry.age,
//                                     description:
//                                         "${entry.description}\n${agePopupList[entry.age]}",
//                                     flavor: entry.flavor,
//                                   )
//                                 else
//                                   LifeStory(
//                                     age: entry.age,
//                                     description: entry.description,
//                                     flavor: entry.flavor,
//                                   ),
//                               ],
//                             );
//                           }),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 BottomNavBar(
//                   player: widget.player!,
//                   lifeStoryDiaryEntries: _lifeStoryDiaryEntries,
//                   onAgeIncrement: () {
//                     // Add a callback for when age increments
//                     setState(() {
//                       // This setState will trigger HomeScreen to rebuild
//                       // and show the updated lifeStoryDiaryEntries.
//                       // The BottomNavBar will add to the list directly.
//                     });
//                   },
//                 ),
//                 StatsSection(player: widget.player!),
//               ],
//             ),
//     );
//   }
// }
