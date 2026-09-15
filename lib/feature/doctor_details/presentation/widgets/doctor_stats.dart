import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorStats extends StatelessWidget {
  const DoctorStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildStat(
            value: '100',
            title: 'Runing',
          ),

          SizedBox(width: 6.w),

          _buildStat(
            value: '500',
            title: 'Ongoing',
          ),

          SizedBox(width: 6.w),

          _buildStat(
            value: '700',
            title: 'Patient',
          ),
        ],
      ),
    );
  }

  Widget _buildStat({
    required String value,
    required String title,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: const Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(9.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text:value,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              
            ),

            SizedBox(height: 3.h),

            CustomText(
              text:title,
                fontSize: 14.sp,
                fontColor: greyColor,
              
            ),
          ],
        ),
      ),
    );
  }
}