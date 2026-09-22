import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:go_router/go_router.dart';

class FeatureDoctorList extends StatelessWidget {
  const FeatureDoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        itemCount: 5,
        separatorBuilder: (_, __) => SizedBox(width: 14.w),
        itemBuilder: (context, index) {
          return const FeatureDoctorCard();
        },
      ),
    );
  }
}

class FeatureDoctorCard extends StatefulWidget {
  const FeatureDoctorCard({super.key});

  @override
  State<FeatureDoctorCard> createState() => _FeatureDoctorCardState();
}

class _FeatureDoctorCardState extends State<FeatureDoctorCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DoctorDetailsRoute().push(context);
      },
      child: Container(
        width: 130.w,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10.r,
              spreadRadius: 1.r,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 18.sp,
                    color: isFavorite ? Colors.red : const Color(0xff7C8091),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 14.sp,
                      color: const Color(0xffFBCB4A),
                    ),
                    SizedBox(width: 4.w),
                    CustomText(
                      text: '3.7',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
            CircleAvatar(
              radius: 32.r,
              backgroundImage: const AssetImage(
                'assets/images/profile_img.png',
              ),
            ),
            CustomText(
              text: 'Dr. Crick',
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
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
        ),
      ),
    );
  }
}
