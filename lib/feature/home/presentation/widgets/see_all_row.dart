import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeAllRow extends StatelessWidget {
  const SeeAllRow({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          fontSize: 20,
          fontColor: black,
          fontWeight: FontWeight.bold,
        ),
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              CustomText(
                text: 'See all',
                fontSize: 14,
                fontColor: greyIconColor,
              ),
              Icon(Icons.arrow_forward_ios, size: 13.sp, color: greyIconColor),
            ],
          ),
        ),
      ],
    );
  }
}
