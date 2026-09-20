import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoleCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final bool selected;
  final VoidCallback onTap;

  const RoleCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.selected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: double.infinity,
            height: 140.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
            decoration: BoxDecoration(
              color: selected ? const Color(0xffF2F8F6) : const Color(0xffFAFBFB),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: selected ? const Color(0xff00875A) : const Color(0xffE4E9E7),
                width: selected ? 1.5 : 1,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Image.asset(
                    imagePath,
                    width: 36.sp,
                    height: 45.sp,
                  ),
                ),

                SizedBox(width: 14.w),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: title,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),

                        SizedBox(height: 4.h),

                        CustomText(
                          text: description,
                          fontSize: 12.sp,
                          fontColor: greyTextColor,
                          height: 1.45,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          if (selected)
            Positioned(
              top: 12.h,
              right: 12.w,
              child: Container(
                width: 20.w,
                height: 20.w,
                decoration: const BoxDecoration(
                  color: Color(0xff007A50),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, color: Colors.white, size: 13.sp),
              ),
            ),
        ],
      ),
    );
  }
}