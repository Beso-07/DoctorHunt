import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectDateList extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDateSelected;

  const SelectDateList({
    super.key,
    required this.selectedIndex,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final dates = [
      const DateItem(
        date: 'Today, 23 Feb',
        slots: 'No slots available',
        hasSlots: false,
      ),
      const DateItem(
        date: 'Tomorrow, 24 Feb',
        slots: '9 slots available',
        hasSlots: true,
      ),
      const DateItem(
        date: 'Thu, 25 Feb',
        slots: '10 slots available',
        hasSlots: true,
      ),
    ];

    return SizedBox(
      height: 58.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final item = dates[index];
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () => onDateSelected(index),
            child: Container(
              width: 150.w,
              padding: EdgeInsets.symmetric(
                horizontal: 6.w,
                vertical: 7.h,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? primaryColor
                    : const Color(0xffF5FAFC),
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                  color: isSelected
                      ? primaryColor
                      : const Color(0xffE3EEF2),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text:item.date,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      fontColor: isSelected
                          ? Colors.white
                          : const Color(0xff30343B),
                    
                  ),

                  SizedBox(height: 3.h),

                  CustomText(
                    text: item.slots,
                      fontSize: 10.sp,
                      fontColor: isSelected
                          ? Colors.white
                          : const Color(0xff8B96A8),
                    
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
class DateItem {
  final String date;
  final String slots;
  final bool hasSlots;

  const DateItem({
    required this.date,
    required this.slots,
    required this.hasSlots,
  });
}
