import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:life_book/views/home/profile_header.dart';
import 'package:life_book/services/user.dart';
import 'package:life_book/theme.dart';
import 'package:life_book/controllers/job_controller.dart';
import 'package:life_book/views/jobs/job_model.dart';
import 'package:life_book/views/jobs/job_service.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key, required this.player});

  final User player;

  @override
  Widget build(BuildContext context) {
    final JobController controller = Get.put(
      JobController(player: player),
      permanent: true,
    );

    final JobService jobService = Get.find<JobService>();

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
                  'JOBS',
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
          // Use Obx to react to changes in currentJobs list
          Obx(
            () => jobService.currentJob.value == null
                ? Container(
                    width: double.infinity,
                    height: 70.h,
                    alignment: Alignment.center,
                    child: Text(
                      "You don’t have any Job",
                      style: GoogleFonts.inter(
                        color: AppColors.blueColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : _buildJobItem(
                    context,
                    controller,
                    jobService.currentJob.value,
                  ),
          ),
          // Available Jobs Section
          Container(
            width: double.infinity,
            height: 21.h,
            decoration: BoxDecoration(color: AppColors.textColor),
            child: Text(
              'Available Jobs',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Use Obx to react to changes in availableJobs list
          Obx(
            () => Expanded(
              child: controller.availableJobItems.isEmpty
                  ? Center(
                      child: Text(
                        'No available jobs.',
                        style: GoogleFonts.inter(color: Colors.black),
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.availableJobItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = controller.availableJobItems[index];
                        return _buildJobItem(context, controller, item);
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  // Extracted job item widget for reusability and cleaner code
  Widget _buildJobItem(
    BuildContext context,
    JobController controller,
    JobItem? item,
  ) {
    return GestureDetector(
      onTap: () {
        controller.handleJobTap(context, item); // Use controller method
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
                        child: Image.asset(item!.imageUrl, fit: BoxFit.contain),
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
                                    text: item.title,
                                    style: GoogleFonts.inter(
                                      color: AppColors.blueColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' (${item.subtitle})',
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
                              '\$${item.salary}',
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
