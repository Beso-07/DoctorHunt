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

    // Shadow
    this.boxShadow,
    this.hasShadow = false,
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

  final bool isLoading;

  // ================= ICON =================

  final String? icon;
  final Color? iconColor;
  final double? iconSize;
  final double spaceBetweenIconAndText;

  // ================= SHADOW =================

  final bool hasShadow;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    final Color currentIconColor = iconColor ?? fontColor ?? primary;

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

          // ================= BORDER =================
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderColor == null ? 0 : 1.2.w,
          ),

          // ================= SHADOW =================
          boxShadow: hasShadow
              ? boxShadow ??
                    [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 15.r,
                        spreadRadius: 0,
                        offset: Offset(0, 5.h),
                      ),
                    ]
              : null,
        ),

        alignment: Alignment.center,

        child: FittedBox(
          fit: BoxFit.scaleDown,

          child: isLoading
              ? CupertinoActivityIndicator(radius: 12.r, color: fontColor)
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ================= ICON =================
                    if (icon != null) ...[
                      SvgPicture.asset(
                        icon!,
                        width: iconSize?.w ?? 18.w,
                        height: iconSize?.h ?? 18.h,

                        colorFilter: ColorFilter.mode(
                          currentIconColor,
                          BlendMode.srcIn,
                        ),
                      ),

                      SizedBox(width: spaceBetweenIconAndText.w),
                    ],

                    // ================= TEXT =================
                    CustomText(
                      text: buttonText,
                      fontSize: fonstSize ?? 16.sp,
                      fontColor: fontColor ?? primary,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
