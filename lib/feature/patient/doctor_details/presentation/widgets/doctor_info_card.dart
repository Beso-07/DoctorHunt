import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:doctorhunt/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DoctorInfoCard extends StatelessWidget {
  const DoctorInfoCard({super.key, this.isSelectTime = false});
  final bool? isSelectTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  'assets/images/doc_details_img.png',
                  fit: BoxFit.cover,
                  width: 70.w,
                  height: 75.h,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Dr. Pediatrician',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 4.h),
                    CustomText(
                      text: 'Specialist Cardiologist',
                      fontSize: 11.sp,
                      fontColor: greyTextColor,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ...List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                size: 14.sp,
                                color: index == 4 ? greyBG : Color(0xffF6D060),
                              ),
                            ),
                          ],
                        ),
                        if (isSelectTime == false) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: r'$ ',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                fontColor: primary,
                              ),
                              CustomText(
                                text: '25.00/',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                fontColor: greyTextColor,
                              ),
                              CustomText(
                                text: ' hours',
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                fontColor: greyTextColor,
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),

              Icon(Icons.favorite, color: Colors.red, size: 21.sp),
            ],
          ),
          if (isSelectTime == false) ...[
            SizedBox(height: 10.h),
            CustomButton(
              radius: 4.r,
              onTap: () {
                context.push('select-time');
              },
              text: 'Book Now',
              width: 140.w,
              height: 35.h,
            ),
          ],
        ],
      ),
    );
  }
}
