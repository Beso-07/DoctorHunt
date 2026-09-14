import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:doctorhunt/core/widgets/defaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeaderSction extends StatelessWidget {
  const HomeHeaderSction({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 150.h,
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 46.h, left: 24.w, right: 24.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Hi Handwerker! ',
                    fontSize: 20,
                    fontColor: white,
                  ),
                  SizedBox(height: 6.h),
                  CustomText(
                    text: 'Find Your Doctor',
                    fontSize: 25,
                    fontColor: white,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              CircleAvatar(
                radius: 30.r,
                backgroundImage: AssetImage('assets/images/profile_img.png'),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.only(top: 120.h, left: 24.w, right: 24.w),
          child: DefaultTextField(
            borderRadius: 6.r,
            hintText: 'Search..... ',
            filledColor: white,
            prefix: Icon(Icons.search, color: greyIconColor, size: 24.w),
            suffix: Icon(Icons.close, color: greyIconColor, size: 24.w),
          ),
        ),
      ],
    );
  }
}
