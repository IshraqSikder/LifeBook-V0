import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:life_book/models/asset_model.dart';
import 'package:life_book/services/CSV_services.dart';
import 'package:life_book/views/home/profile_header.dart';
import 'package:life_book/models/user.dart';
import 'package:life_book/theme.dart';

class AssetScreen extends StatelessWidget {
  const AssetScreen({super.key, required this.player});

  final User player;

  @override
  Widget build(BuildContext context) {
    // final AssetController controller = Get.put(
    //   AssetController(player: player),
    //   permanent: true,
    // );

    return Scaffold(
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
                  onTap: () => Get.back(), // Use Get.back() to navigate back
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
                  style: GoogleFonts.inter(
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
              'Current Job',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Use Obx to react to changes in currentassets list
          // Obx(
          //   () => assetservice.currentJob.value == null
          //       ? Container(
          //           width: double.infinity,
          //           height: 70.h,
          //           alignment: Alignment.center,
          //           child: Text(
          //             "You don’t have any Job",
          //             style: GoogleFonts.inter(
          //               color: AppColors.blueColor,
          //               fontSize: 16.sp,
          //               fontWeight: FontWeight.w700,
          //             ),
          //           ),
          //         )
          //       : _buildJobItem(
          //           context,
          //           controller,
          //           assetservice.currentJob.value,
          //         ),
          // ),
          // Available assets Section
          Container(
            width: double.infinity,
            height: 21.h,
            decoration: BoxDecoration(color: AppColors.textColor),
            child: Text(
              'Available assets',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Use Obx to react to changes in availableassets list
          Obx(
            () => Expanded(
              child: assetList.isEmpty
                  ? Center(
                      child: Text(
                        'No available assets.',
                        style: GoogleFonts.inter(color: Colors.black),
                      ),
                    )
                  : ListView.builder(
                      itemCount: assetList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = assetList[index];
                        return _buildAssetItem(context, item);
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  // Extracted asset item widget for reusability and cleaner code
  // Widget _buildAssetItem(BuildContext context, AssetModel item) {
  Widget _buildAssetItem(BuildContext context, Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        // controller.handleJobTap(context, item); // Use controller method
      },
      child: Container(
        width: double.infinity,
        height: 70.h,
        decoration: BoxDecoration(
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
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Row(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // image
                      SizedBox(
                        width: 33.w,
                        height: 33.h,
                        child: Image.asset(
                          // "assets/images/real_estates/${item['imageUrl']}.png",
                          "assets/images/real_estates/${item['imageUrl']}.png",
                          fit: BoxFit.contain,
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
                            // title and subtitle
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    // text: item.title,
                                    text: item['title'],
                                    style: GoogleFonts.inter(
                                      color: AppColors.blueColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    // text: ' (${item.subtitle})',
                                    text: ' (${item['subtitle']})',
                                    style: GoogleFonts.inter(
                                      color: AppColors.blueColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // price
                            Text(
                              // '\$${item.price}',
                              '\$${item['price']}',
                              style: GoogleFonts.inter(
                                color: AppColors.blueColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.36.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  // icon
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
    );
  }
}
