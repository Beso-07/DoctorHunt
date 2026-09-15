import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.fontColor,
    this.backgroundColor,
    this.onTap,
    this.isLoading = false,
    this.width,
    this.height,
    this.fontWeight,
    this.decoration,
    this.fontSize,
    this.radius,
  });
  final String text;
  final Color? fontColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isLoading;
  final double? width;
  final double? height;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final double? fontSize;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height?? 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10.r),
          color: backgroundColor ?? primaryColor,
        ),
        child: isLoading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CupertinoActivityIndicator(
                  color: Colors.white,
                  radius: 15.r,
                ),
              )
            : Center(
                child: CustomText(
                  text: text,
                  decoration: decoration,
                  fontSize: fontSize ?? 18.sp,
                  fontWeight: fontWeight ?? FontWeight.w500,
                  fontColor: fontColor ?? Colors.white,
                ),
              ),
      ),
    );
  }
}
