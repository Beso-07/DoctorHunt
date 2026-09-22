import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const PatientBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15.r,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              index: 0,
              iconPath: 'assets/images/home_icon.png',
            ),
            _buildNavItem(
              index: 1,
              iconPath: 'assets/images/fav_icon.png',
            ),
            _buildNavItem(
              index: 2,
              iconPath: 'assets/images/book_icon.png',
            ),
            _buildNavItem(
              index: 3,
              iconPath: 'assets/images/chat_icon.png',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String iconPath,
  }) {
    final bool isSelected = currentIndex == index;
    const Color activeColor = Color(0xff0EBE7F);
    const Color inactiveColor = Color(0xff858EA9);

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.all(isSelected ? 12.r : 0),
        decoration: BoxDecoration(
          color: isSelected ? activeColor : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          iconPath,
          width: 24.w,
          height: 24.h,
          color: isSelected ? Colors.white : inactiveColor,
          colorBlendMode: BlendMode.srcIn,
        ),
      ),
    );
  }
}