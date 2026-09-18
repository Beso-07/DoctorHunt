import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        separatorBuilder: (_, __) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
          return Container(
            width: 115.w,
            height: 130.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff3F51F5), Color(0xff635BFF)],
              ),
            ),
            child: Stack(
              children: [
                // Background circle/shape
                Positioned(
                  right: -20.w,
                  bottom: -15.h,
                  child: Container(
                    width: 90.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.08),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  ),
                ),

                // Icon
                Center(
                  child: Image.asset(
                    'assets/images/teeth_icon.png',
                    width: 50.w,
                    height: 50.h,
                  ),
                ),

                // Count
                Positioned(
                  left: 10.w,
                  bottom: 10.h,
                  child: CustomText(
                    text:'12',
                      fontColor: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
