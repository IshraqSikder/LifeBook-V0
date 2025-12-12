import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:life_book/controllers/home_controller.dart';
import 'package:life_book/theme.dart';

class CustomAppBarNew extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarNew({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Obx(
      () => AppBar(
        backgroundColor: AppColors.redColor,
        toolbarHeight: 75.h,
        centerTitle: controller.isMenuToggled.value,
        titleSpacing: 0,

        // Icon
        leading: GestureDetector(
          onTap: controller.toggleMenu,
          child: Container(
            width: 30.w,
            height: 30.h,
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
            margin: EdgeInsets.only(top: 10.h, bottom: 7.h, left: 7.w),
            child: controller.isMenuToggled.value
                ? SvgPicture.asset(
                    "assets/icons/cancel.svg",
                    fit: BoxFit.contain,
                  )
                : Image.asset("assets/images/menu.png", fit: BoxFit.contain),
          ),
        ),

        // Title
        title: controller.isMenuToggled.value
            ? Text(
                'MAIN MENU',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w900,
                ),
              )
            : Row(
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
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(75.h);
}
