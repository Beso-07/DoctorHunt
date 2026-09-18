import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:doctorhunt/feature/patient/doctor_details/presentation/widgets/doctor_info_card.dart';
import 'package:doctorhunt/feature/patient/doctor_details/presentation/widgets/doctor_location.dart';
import 'package:doctorhunt/feature/patient/doctor_details/presentation/widgets/doctor_services.dart';
import 'package:doctorhunt/feature/patient/doctor_details/presentation/widgets/doctor_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // =================== AppBar =================== //
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        width: 38.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: greyBG),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 17.sp,
                          color: greyIconColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 14.w),
                    CustomText(
                      text: 'Doctor Details',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    const Spacer(),
                    Icon(Icons.search, size: 24.sp, color: greyIconColor),
                  ],
                ),
                SizedBox(height: 20.h),
                const DoctorInfoCard(),
                SizedBox(height: 20.h),
                const DoctorStats(),
                SizedBox(height: 24.h),
                const DoctorServices(),
                SizedBox(height: 24.h),
                const DoctorLocation(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
