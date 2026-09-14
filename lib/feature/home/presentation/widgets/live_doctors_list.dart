import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveDoctorsList extends StatelessWidget {
  const LiveDoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 180.w,
            height: 220 .h,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset('assets/images/live_img.png', fit: BoxFit.cover),
                // Live Badge
                Positioned(
                  top: 40.h,
                  right: 22.w,
                  child: Image.asset(
                    'assets/images/live_icon.png',
                    width: 50.w,
                    height: 20.h,
                    fit: BoxFit.cover,
                  ),
                ),
          
                // Play Button
                Center(
                  child: Image.asset(
                    'assets/images/play_icon.png',
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
