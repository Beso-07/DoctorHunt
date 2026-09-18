import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PopularDoctorsList extends StatelessWidget {
  const PopularDoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 295.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h), 
        itemCount: 5,
        separatorBuilder: (_, __) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.push('doctor-details');
            },
            child: Container(
              width: 190.w,
              clipBehavior: Clip.antiAlias, 
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08), 
                    blurRadius: 10.r,                     
                    spreadRadius: 1.r,
                    offset: const Offset(0, 4),            
                  ),
                ],
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(14.r),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 180.h,
                      child: Image.asset(
                        'assets/images/doc_img.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            
                  SizedBox(height: 10.h),
                  CustomText(
                    text: 'Dr. Fillerup Grab',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
            
                  SizedBox(height: 2.h),
            
                  CustomText(
                    text: 'Medicine Specialist',
                    fontSize: 12.sp,
                    fontColor: greyTextColor,
                  ),
                  
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Icon(
                                Icons.star,
                                size: 14.sp,
                                color: index == 4 ? greyBG : Color(0xffF6D060),
                              ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}