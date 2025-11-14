// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:get/get.dart';
// import 'package:life_book/controllers/tutorial_controller.dart';
// import 'package:life_book/models/character.dart';
// import 'package:life_book/theme.dart';

// class TutorialScreenNew extends StatelessWidget {
//   final Character player; // Player is required again

//   const TutorialScreenNew({super.key, required this.player});

//   @override
//   Widget build(BuildContext context) {
//     final TutorialScreenController controller = Get.put(
//       TutorialScreenController(player),
//     );
//     return Scaffold(
//       backgroundColor: Colors.black.withValues(alpha: 0.6),
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         padding: EdgeInsets.all(32.r),
//         decoration: BoxDecoration(
//           backgroundBlendMode: BlendMode.softLight,
//           color: Colors.black.withValues(alpha: 0.54),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Column(
//               children: [
//                 Wrap(
//                   alignment: WrapAlignment.center,
//                   runAlignment: WrapAlignment.center,
//                   crossAxisAlignment: WrapCrossAlignment.center,
//                   children: [
//                     Image.asset(
//                       'assets/images/point.png',
//                       width: 16.w,
//                       height: 16.h,
//                       fit: BoxFit.contain,
//                     ),
//                     SizedBox(width: 5.w),
//                     Text(
//                       'Press',
//                       style: GoogleFonts.inter(
//                         color: AppColors.yellowColor,
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     Text(
//                       ' Age ',
//                       style: GoogleFonts.inter(
//                         color: Colors.white,
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     Text(
//                       'to grow older one year',
//                       style: GoogleFonts.inter(
//                         color: AppColors.yellowColor,
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     Text(
//                       'at a time.',
//                       style: GoogleFonts.inter(
//                         color: AppColors.yellowColor,
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 8.h),
//                 Text(
//                   'Make choices as you go.',
//                   style: GoogleFonts.inter(
//                     color: AppColors.yellowColor,
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 SizedBox(height: 8.h),
//                 Text(
//                   'Live your best(or worst) life.',
//                   style: GoogleFonts.inter(
//                     color: AppColors.yellowColor,
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 32.h),
//             _buildTAB(controller),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTAB(TutorialScreenController controller) {
//     return GestureDetector(
//       onTap: () {
//         controller.goToHomeScreen(); // called controller method
//       },
//       child: Container(
//         height: 110.h,
//         width: 100.w,
//         padding: EdgeInsets.all(5.r),
//         decoration: BoxDecoration(
//           color: AppColors.textColor,
//           shape: BoxShape.circle,
//           border: Border.all(
//             color: AppColors.redColor,
//             strokeAlign: BorderSide.strokeAlignCenter,
//             width: 3.w,
//           ),
//         ),
//         child: Container(
//           width: 105.w,
//           height: 105.h,
//           padding: EdgeInsets.all(5.r),
//           decoration: BoxDecoration(
//             color: AppColors.greenColor,
//             shape: BoxShape.circle,
//           ),
//           child: Container(
//             width: 105.w,
//             height: 105.h,
//             padding: EdgeInsets.all(10.r),
//             decoration: BoxDecoration(
//               color: AppColors.greenColor,
//               shape: BoxShape.circle,
//               border: Border.all(
//                 width: 2.5.w,
//                 strokeAlign: BorderSide.strokeAlignOutside,
//                 color: Colors.white,
//               ),
//             ),
//             child: const Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Icon(Icons.add, color: Colors.white, size: 40),
//                 Text(
//                   'Age',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:life_book/controllers/tutorial_controller.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/theme.dart';

class TutorialScreenNew extends StatelessWidget {
  final User player;

  const TutorialScreenNew({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    final TutorialScreenController controller = Get.put(
      TutorialScreenController(player),
    );
    return Scaffold(
      backgroundColor: Colors.black.withValues(alpha: 0.6),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(32.r),
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.softLight,
          color: Colors.black.withValues(alpha: 0.54),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/point.png',
                      width: 16.w,
                      height: 16.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Press',
                      style: GoogleFonts.inter(
                        color: AppColors.yellowColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' Age ',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'to grow older one year',
                      style: GoogleFonts.inter(
                        color: AppColors.yellowColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'at a time.',
                      style: GoogleFonts.inter(
                        color: AppColors.yellowColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  'Make choices as you go.',
                  style: GoogleFonts.inter(
                    color: AppColors.yellowColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Live your best(or worst) life.',
                  style: GoogleFonts.inter(
                    color: AppColors.yellowColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.h),
            _buildTAB(controller),
          ],
        ),
      ),
    );
  }

  Widget _buildTAB(TutorialScreenController controller) {
    return GestureDetector(
      onTap: () {
        controller.goToHomeScreen(); // called controller method
      },
      child: Container(
        height: 110.h,
        width: 100.w,
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
          color: AppColors.textColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.redColor,
            strokeAlign: BorderSide.strokeAlignCenter,
            width: 3.w,
          ),
        ),
        child: Container(
          width: 105.w,
          height: 105.h,
          padding: EdgeInsets.all(5.r),
          decoration: BoxDecoration(
            color: AppColors.greenColor,
            shape: BoxShape.circle,
          ),
          child: Container(
            width: 105.w,
            height: 105.h,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: AppColors.greenColor,
              shape: BoxShape.circle,
              border: Border.all(
                width: 2.5.w,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Colors.white,
              ),
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Colors.white, size: 40),
                Text(
                  'Age',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
