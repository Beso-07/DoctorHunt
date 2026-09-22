import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AdminBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(.08))
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              index: 0,
              iconPath: 'assets/images/doctors_icon.png',
              label: 'Doctors',
            ),
            _buildNavItem(
              index: 1,
              iconPath: 'assets/images/settings_icon.png',
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String iconPath,
    required String label,
  }) {
    final bool isSelected = currentIndex == index;
    const Color activeColor = Color(0xff0EBE7F);
    const Color inactiveColor = Color(0xff858EA9);
    final Color currentColor = isSelected ? activeColor : inactiveColor;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            width: 24.w,
            height: 24.h,
            color: currentColor,
            colorBlendMode: BlendMode.srcIn,
          ),
          SizedBox(height: 8.h),
          CustomText(
            text:label,
              fontSize: 14.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
              fontColor: currentColor,
            
          ),
        ],
      ),
    );
  }
}