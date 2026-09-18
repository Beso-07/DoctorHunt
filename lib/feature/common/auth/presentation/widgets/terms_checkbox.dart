import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsCheckbox extends StatelessWidget {
  const TermsCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 20.w,
          height: 20.h,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            shape: const CircleBorder(),
            checkColor: primary,
            fillColor: WidgetStateProperty.all(Color(0xff67729480)),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
        ),

        SizedBox(width: 6.w),
        Expanded(
          child: CustomText(
            text:
                'I agree with the Terms of Service & Privacy Policy',
            fontSize: 12.sp,
            fontColor: greyColorText,
          ),
        ),
      ],
    );
  }
}