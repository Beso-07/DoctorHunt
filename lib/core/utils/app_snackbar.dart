import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    Duration duration = const Duration(seconds: 3),
    IconData? icon,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: textColor, size: 18.sp),
              SizedBox(width: 8.w),
            ],
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        duration: duration,
        margin: EdgeInsets.only(
          bottom: 20.h,
          left: 20.w,
          right: 20.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }

  // SUCCESS
  static void success(BuildContext context, String message) {
    show(
      context,
      message: message,
      backgroundColor: Colors.green,
      icon: Icons.check_circle,
    );
  }

  // ERROR
  static void error(BuildContext context, String message) {
    show(
      context,
      message: message,
      backgroundColor: Colors.red,
      icon: Icons.error,
    );
  }

  // WARNING
  static void warning(BuildContext context, String message) {
    show(
      context,
      message: message,
      backgroundColor: Colors.orange,
      icon: Icons.warning,
    );
  }

  // INFO
  static void info(BuildContext context, String message) {
    show(
      context,
      message: message,
      backgroundColor: Colors.blue,
      icon: Icons.info,
    );
  }
}