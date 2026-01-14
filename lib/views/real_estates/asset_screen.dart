import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:life_book/controllers/asset_controller.dart';
import 'package:life_book/models/asset_model.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/theme.dart';
import 'package:life_book/views/home/profile_header.dart';

class AssetScreen extends StatelessWidget {
  const AssetScreen({super.key, required this.player});

  final User player;

  @override
  Widget build(BuildContext context) {
    final AssetController controller = Get.put(
      AssetController(player: player),
      permanent: true,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.profileHeaderColor,
        toolbarHeight: 0.h,
        elevation: 0,
      ),
      body: Column(
        children: [
          ProfileHeader(),
          Expanded(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 44.h,
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  decoration: BoxDecoration(color: AppColors.blueColor),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: SvgPicture.asset(
                          'assets/icons/cancel.svg',
                          width: 24.w, height: 24.h, fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(width: 125.w),
                      Text(
                        'ASSETS',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),

                // Rest of your content
                Container(
                  width: double.infinity,
                  height: 21.h,
                  decoration: BoxDecoration(color: AppColors.textColor),
                  child: Center(
                    child: Text(
                      'Current Asset',
                      style: TextStyle(fontFamily: 'Inter', color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                // Lists...
                Obx(() {
                  final sortedCurrentItemList = controller.sortedCurrentAssets;
                  return sortedCurrentItemList.isEmpty
                      ? Container(
                    height: 70.h,
                    alignment: Alignment.center,
                    child: Text(
                      "You don’t have any asset",
                      style: TextStyle(fontFamily: 'Inter', color: AppColors.blueColor, fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                  )
                      : ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: sortedCurrentItemList.length,
                    itemBuilder: (context, index) {
                      return _buildAssetItem(context, controller, sortedCurrentItemList[index], isOwned: true);
                    },
                  );
                }),

                Container(
                  width: double.infinity,
                  height: 21.h,
                  decoration: BoxDecoration(color: AppColors.textColor),
                  child: Center(
                    child: Text(
                      'Available assets',
                      style: TextStyle(fontFamily: 'Inter', color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                Expanded(
                  child: Obx(() {
                    final sortedAvailableItemList = controller.sortedAvailableAssets;
                    return sortedAvailableItemList.isEmpty
                        ? Center(child: Text('No available assets.'))
                        : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: sortedAvailableItemList.length,
                      itemBuilder: (context, index) {
                        return _buildAssetItem(context, controller, sortedAvailableItemList[index], isOwned: false);
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssetItem(BuildContext context, AssetController controller, AssetModel item, {required bool isOwned}) {
    return Obx(() {
      final int currentBalance = controller.player.gameStats.balanceRx.value;
      final bool isAffordable = currentBalance >= item.price;
      final bool isActive = isOwned || isAffordable;

      return Opacity(
        opacity: isActive ? 1.0 : 0.5,
        child: GestureDetector(
          onTap: isActive ? () => controller.handleAssetTap(context, item) : null,
          child: Container(
            width: double.infinity,
            height: 70.h,
            decoration: BoxDecoration(
              color: isActive ? Colors.transparent : Colors.grey.withValues(alpha: 0.1),
              border: Border(bottom: BorderSide(width: 0.50.w, color: Colors.black)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 33.w, height: 33.h,
                        child: Image.asset("assets/images/real_estates/${item.imageUrl}.png", fit: BoxFit.contain, color: isActive ? null : Colors.grey[100], colorBlendMode: isActive ? null : BlendMode.saturation),
                      ),
                      SizedBox(width: 5.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(TextSpan(children: [
                            TextSpan(text: item.title, style: TextStyle(fontFamily: 'Inter', color: isActive ? AppColors.blueColor : Colors.grey[800], fontSize: 16.sp, fontWeight: FontWeight.w700)),
                            TextSpan(text: ' (${item.subtitle})', style: TextStyle(fontFamily: 'Inter', color: isActive ? AppColors.blueColor : Colors.grey[800], fontSize: 16.sp, fontWeight: FontWeight.w300)),
                          ])),
                          SizedBox(height: 4.h),
                          Text('\$${item.price}', style: TextStyle(fontFamily: 'Inter', color: isActive ? AppColors.blueColor : Colors.grey[800], fontSize: 12.sp, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Spacer(),
                      if (isActive)
                        SizedBox(width: 32.w, height: 32.h, child: SvgPicture.asset("assets/images/menu/three-dot.svg", fit: BoxFit.contain)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}