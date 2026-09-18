import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:doctorhunt/feature/patient/home/presentation/widgets/categories_list.dart';
import 'package:doctorhunt/feature/patient/home/presentation/widgets/feature_doctor_list.dart';
import 'package:doctorhunt/feature/patient/home/presentation/widgets/home_header_sction.dart';
import 'package:doctorhunt/feature/patient/home/presentation/widgets/live_doctors_list.dart';
import 'package:doctorhunt/feature/patient/home/presentation/widgets/popular_doctors_list.dart';
import 'package:doctorhunt/feature/patient/home/presentation/widgets/see_all_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================== Header Section ==================== //
            HomeHeaderSction(),
            SizedBox(height: 24.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // =============== Live && Categories Section ==================== //
                  Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: CustomText(
                      text: 'Live Doctors',
                      fontSize: 20,
                      fontColor: black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  LiveDoctorsList(),
                  Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: CategoriesList(),
                  ),
                  SizedBox(height: 16.h),

                  // =============== Popular Doctors ==================== //
                  SeeAllRow(title: 'Popular Doctors', onTap: () {}),
                  SizedBox(height: 16.h),
                  PopularDoctorsList(),
                  SizedBox(height: 16.h),
                  SeeAllRow(title: 'Feature Doctor', onTap: () {}),
                  SizedBox(height: 16.h),
                  FeatureDoctorList(),

                ],
              ),
            ),
            SizedBox(height: 32.h,)
          ],
        ),
      ),
    );
  }
}
