import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/style_size.dart';

class CustomText extends StatelessWidget {
  final String text;

  final String? secondText;

  final double? fontSize;

  final FontWeight? fontWeight;

  final Color? fontColor;

  final Color? secondColor;

  final String? fontFamily;

  final double? height;

  final double? letterSpacing;

  final double? wordSpacing;

  final TextAlign textAlign;

  final int? maxLines;

  final TextOverflow overflow;

  final TextDecoration? decoration;

  final Color? decorationColor;

  final bool softWrap;

  final TextStyle? style;

  final TextStyle? secondStyle;

  final bool useThemeStyle;

  final bool useSecondThemeStyle;

  final TextDirection? textDirection;

  final TextBaseline? textBaseline;

  const CustomText({
    super.key,

    required this.text,

    this.secondText,

    this.fontSize,

    this.fontWeight,

    this.fontColor,

    this.secondColor,

    this.fontFamily,

    this.height,

    this.letterSpacing,

    this.wordSpacing,

    this.textAlign = TextAlign.start,

    this.maxLines,

    this.overflow = TextOverflow.visible,

    this.decoration,

    this.decorationColor,

    this.softWrap = true,

    this.style,

    this.secondStyle,

    this.useThemeStyle = false,

    this.useSecondThemeStyle = false,

    this.textDirection,

    this.textBaseline,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,

      maxLines: maxLines,

      overflow: overflow,

      softWrap: softWrap,

      textDirection: textDirection,

      text: TextSpan(
        children: [
          TextSpan(
            text: text,

            style: useThemeStyle
                ? style
                : TextStyle(
                    fontSize: fontSize ?? 16.sp,

                    fontWeight: fontWeight ?? AppFontStyle.fontWeights.medium,

                    color: fontColor ?? blackDegree,

                    fontFamily: fontFamily ?? AppFontFamily.sfPro,

                    height: height,

                    letterSpacing: letterSpacing,

                    wordSpacing: wordSpacing,

                    decoration: decoration,

                    decorationColor: decorationColor,

                    textBaseline: textBaseline,
                  ),
          ),

          // =========================
          // Second Text
          // =========================
          if (secondText != null)
            TextSpan(
              text: secondText,

              style: useSecondThemeStyle
                  ? secondStyle
                  : TextStyle(
                      fontSize: fontSize ?? 16.sp,

                      fontWeight: fontWeight ?? AppFontStyle.fontWeights.medium,

                      color: secondColor ?? blackDegree,

                      fontFamily: fontFamily ?? AppFontFamily.sfPro,

                      height: height,

                      letterSpacing: letterSpacing,

                      wordSpacing: wordSpacing,

                      decoration: decoration,

                      decorationColor: decorationColor,

                      textBaseline: textBaseline,
                    ),
            ),
        ],
      ),
    );
  }
}
