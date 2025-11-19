import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/controllers/asset_controller.dart';
import 'package:life_book/models/asset_model.dart';
import 'package:life_book/theme.dart';

class AssetDetailsPopup extends StatelessWidget {
  final AssetModel item;
  final bool isCurrent;

  const AssetDetailsPopup({
    super.key,
    required this.item,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    final AssetController controller = Get.find<AssetController>();
    return Dialog(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            constraints: BoxConstraints(maxWidth: 350).w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Color(0xFF007DD1), width: 5.w),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Asset header
                Container(
                  width: double.infinity,
                  height: 35.h,
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  margin: EdgeInsets.only(top: 35.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [Color(0xFF007DD1), Color(0xFFF8F7F3)],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Asset Info',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          letterSpacing: 0.5.sp,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),

                // Asset title with icon
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/real_estates/${item.imageUrl}.png",
                        width: 30.w,
                        height: 30.h,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        item.title,
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.deepBlueColor,
                        ),
                      ),
                      Text(
                        " (${item.subtitle})",
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColors.deepBlueColor,
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 35.h),

                // Asset Details content
                Container(
                  margin: EdgeInsets.only(
                    left: 25.w,
                    right: 25.w,
                    bottom: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile details
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildAssetDetail('Title:', "Real Estate"),
                          SizedBox(height: 8),
                          _buildAssetDetail('House Type:', item.title),
                          SizedBox(height: 8),
                          _buildAssetDetail('Location:', item.subtitle),
                          SizedBox(height: 8),
                          _buildAssetDetail('Price:', '\$${item.price}'),
                        ],
                      ),

                      SizedBox(height: 25.h),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            isCurrent
                                ? controller.resignAsset(item)
                                : controller.applyForAsset(item);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isCurrent
                                ? const Color(0xFF9B2727)
                                : const Color(0xFF4CAF50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5).r,
                            ),
                            elevation: 3,
                            shadowColor: const Color(0xFFBAB9B7),
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 10.h,
                            ),
                          ),
                          child: Text(
                            isCurrent ? 'Sell' : 'Buy',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Cancel Button
          Positioned(
            top: -10.h,
            left: -10.w,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 0,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.close,
                  color: AppColors.redColor,
                  size: 20.r,
                  weight: 800.0.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssetDetail(String label, String value) {
    return Container(
      width: double.infinity,
      color: Color(0xFFEDECE8),
      padding: EdgeInsets.all(5.r),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: label,
              style: GoogleFonts.inter(
                color: AppColors.deepBlueColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            TextSpan(
              text: ' $value',
              style: GoogleFonts.inter(
                color: AppColors.deepBlueColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
