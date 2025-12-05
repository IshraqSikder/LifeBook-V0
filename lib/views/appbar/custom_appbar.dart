import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/controllers/home_controller.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/theme.dart';

class CustomAppBarNew extends StatelessWidget implements PreferredSizeWidget {
  // final Character player;
  final User player;

  const CustomAppBarNew({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    // Find the already initialized HomeController
    final HomeController controller = Get.find<HomeController>();

    return AppBar(
      backgroundColor: AppColors.redColor,
      toolbarHeight: 75.h,
      leading: GestureDetector(
        onTap: controller.toggleMenu, // Call the controller's toggle method
        child: Container(
          width: 30.w,
          height: 30.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          margin: EdgeInsets.only(top: 7.h, bottom: 7.h),
          child: Obx(
            () =>
                controller
                    .isMenuToggled
                    .value // Observe the controller's state
                ? SvgPicture.asset(
                    "assets/icons/cancel.svg",
                    fit: BoxFit.contain,
                  )
                : Image.asset("assets/images/menu.png", fit: BoxFit.contain),
          ),
        ),
      ),
      centerTitle: controller.isMenuToggled.value
          ? true
          : false, // Also observe here
      titleSpacing: 0,
      title: Obx(
        () => Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // If menu is open, show "MAIN MENU"
            if (controller.isMenuToggled.value)
              Text(
                'MAIN MENU',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w900,
                ),
              )
            else // If menu is closed, show "LifeBook" logo and title
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 38.w,
                    height: 38.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: SvgPicture.asset("assets/icons/logo.svg"),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'LifeBook',
                    style: TextStyle(
                      color: AppColors.yellowColor,
                      fontSize: 28.sp,
                      fontFamily: 'Jaro',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(75.h);
}
