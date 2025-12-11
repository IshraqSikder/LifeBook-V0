import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:life_book/controllers/asset_controller.dart';
import 'package:life_book/models/asset_model.dart';
import 'package:life_book/services/asset_service.dart';
import 'package:life_book/views/home/profile_header.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/theme.dart';

class AssetScreen extends StatelessWidget {
  const AssetScreen({super.key, required this.player});

  final User player;

  @override
  Widget build(BuildContext context) {
    final AssetController controller = Get.put(
      AssetController(player: player),
      permanent: true,
    );

    // final AssetService assetService = Get.find<AssetService>();

    return Scaffold(
      // backgroundColor: AppColors.profileHeaderColor,
      appBar: AppBar(
        backgroundColor: AppColors.profileHeaderColor,
        toolbarHeight: 0.h,
        elevation: 0,
      ),
      body: Column(
        children: [
          ProfileHeader(),
          Container(
            width: double.infinity,
            height: 44.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(color: AppColors.blueColor),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: SvgPicture.asset(
                    'assets/icons/cancel.svg',
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 125.w),
                Text(
                  'ASSETS',
                  textAlign: TextAlign.center,
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
          // Current Job Section
          Container(
            width: double.infinity,
            height: 21.h,
            decoration: BoxDecoration(color: AppColors.textColor),
            child: Text(
              'Current Asset',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Obx(() {
            final sortedCurrentItemList = controller.sortedCurrentAssets;

            return sortedCurrentItemList.isEmpty
                ? Container(
                    width: double.infinity,
                    height: 70.h,
                    alignment: Alignment.center,
                    child: Text(
                      "You don’t have any asset",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: AppColors.blueColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: sortedCurrentItemList.length,
                    itemBuilder: (context, index) {
                      final item = sortedCurrentItemList[index];
                      return _buildAssetItem(
                        context,
                        controller,
                        item,
                        isOwned: true,
                      );
                    },
                  );
          }),
          // Available assets Section
          Container(
            width: double.infinity,
            height: 21.h,
            decoration: BoxDecoration(color: AppColors.textColor),
            child: Text(
              'Available assets',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Use Obx to react to changes in available assets list
          Expanded(
            child: Obx(() {
              final sortedAvailableItemList = controller.sortedAvailableAssets;

              return sortedAvailableItemList.isEmpty
                  ? Center(
                      child: Text(
                        'No available assets.',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.black,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: sortedAvailableItemList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = sortedAvailableItemList[index];

                        return _buildAssetItem(
                          context,
                          controller,
                          item,
                          isOwned: false,
                        );
                      },
                    );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildAssetItem(
    BuildContext context,
    AssetController controller,
    AssetModel item, {
    required bool isOwned,
  }) {
    return Obx(() {
      final int currentBalance = controller.player.gameStats.balanceRx.value;

      // Logic: Item is active if we own it OR if we have enough money
      final bool isAffordable = currentBalance >= item.price;
      final bool isActive = isOwned || isAffordable;

      return Opacity(
        // Reduce opacity if inactive to give visual feedback
        opacity: isActive ? 1.0 : 0.5,
        child: GestureDetector(
          onTap: isActive
              ? () => controller.handleAssetTap(context, item)
              : null,
          child: Container(
            width: double.infinity,
            height: 70.h,
            decoration: BoxDecoration(
              color: isActive
                  ? Colors.transparent
                  : Colors.grey.withValues(alpha: 0.1),
              border: Border(
                bottom: BorderSide(width: 0.50.w, color: Colors.black),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 33.w,
                        height: 33.h,
                        child: Image.asset(
                          "assets/images/real_estates/${item.imageUrl}.png",
                          fit: BoxFit.contain,
                          color: isActive ? null : Colors.grey[100],
                          colorBlendMode: isActive
                              ? null
                              : BlendMode.saturation,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: item.title,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: isActive
                                          ? AppColors.blueColor
                                          : Colors.grey[800],
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' (${item.subtitle})',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: isActive
                                          ? AppColors.blueColor
                                          : Colors.grey[800],

                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '\$${item.price}',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: isActive
                                    ? AppColors.blueColor
                                    : Colors.grey[800],
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.36.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      if (isActive)
                        SizedBox(
                          width: 32.w,
                          height: 32.h,
                          child: SvgPicture.asset(
                            "assets/images/menu/threedot.svg",
                            fit: BoxFit.contain,
                          ),
                        ),
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
