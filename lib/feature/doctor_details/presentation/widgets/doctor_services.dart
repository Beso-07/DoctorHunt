import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorServices extends StatelessWidget {
  const DoctorServices({super.key});

  @override
  Widget build(BuildContext context) {
    const services = [
      'Patient care should be the number one priority.',
      'If you run your practice you know how frustrating.',
      'That’s why some of appointment reminder system.',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Services',
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          
        ),

        SizedBox(height: 10.h),

        ...List.generate(
          services.length,
          (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 16.w,
                    child: CustomText(
                      text: '${index + 1}.',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        fontColor: primary,
                      
                    ),
                  ),

                  SizedBox(width: 4.w),

                  Expanded(
                    child: CustomText(
                      text:services[index],
                        fontSize: 14.sp,
                        height: 1.4,
                        fontColor: greyTextColor,
                      
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}