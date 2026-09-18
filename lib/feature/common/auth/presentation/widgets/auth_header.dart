import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: title,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center,
          fontColor: Colors.black,
        ),
        SizedBox(height: 8.h),
        CustomText(
          text:
              'You can search a course, apply course and find scholarship for abroad studies',
          fontSize: 14.sp,
          height: 1.7,
          textAlign: TextAlign.center,
          fontColor: greyColorText,
        ),
      ],
    );
  }
}