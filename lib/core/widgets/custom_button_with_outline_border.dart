import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtonWithOutlineBorder extends StatelessWidget {
  const CustomButtonWithOutlineBorder({
    super.key,
    this.borderColor,
    this.fillColor,
    required this.buttonText,
    this.verticalPadding,
    this.horizontalPadding,
    this.circularRadius = 10,
    this.width,
    this.height,
    this.fonstSize,
    this.onTap,
    this.fontColor,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.spaceBetweenIconAndText = 8,
    this.isLoading = false,
  });

  final Color? borderColor;
  final Color? fillColor;
  final String buttonText;

  final double? verticalPadding;
  final double? horizontalPadding;
  final double circularRadius;
  final double? width;
  final double? height;
  final double? fonstSize;

  final VoidCallback? onTap;
  final Color? fontColor;

  final bool isLoading ;
  // ===== Icon options =====
  final String? icon;
  final Color? iconColor;
  final double? iconSize;
  final double spaceBetweenIconAndText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width?.w,
        height: height?.h,
        padding: EdgeInsets.symmetric(
          vertical: (verticalPadding ?? 12).h,
          horizontal: (horizontalPadding ?? 16).w,
        ),
        decoration: BoxDecoration(
          color: fillColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(circularRadius.r),
          border: Border.all(
            color: borderColor ?? primary,
            width: 1.2.w,
          ),
        ),
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: isLoading ?  CupertinoActivityIndicator(radius: 12.r , color: fontColor):  Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                SvgPicture.asset(
                  icon!,
                  color: iconColor ?? fontColor ?? primary,
                ),
                SizedBox(width: spaceBetweenIconAndText.w),
              ],
              CustomText(
                text: buttonText,
                fontSize: fonstSize??16.sp,
                fontColor: fontColor ?? primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
