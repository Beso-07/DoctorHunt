import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FieldLabel extends StatelessWidget {
  const FieldLabel({
    super.key,
    required this.title,
    required this.child,
    this.spacing = 6,
    this.titleColor,
  });

  final String title;
  final Widget child;
  final double spacing;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: titleColor
          ),
        ),
        SizedBox(height: spacing.h),
        child,
      ],
    );
  }
}