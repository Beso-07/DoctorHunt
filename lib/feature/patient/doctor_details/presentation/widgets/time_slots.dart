import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:doctorhunt/core/widgets/custom_button.dart';
import 'package:doctorhunt/core/widgets/custom_button_with_outline_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeSlots extends StatelessWidget {
  final int selectedDateIndex;
  final String? selectedTime;
  final ValueChanged<String> onTimeSelected;

  const TimeSlots({
    super.key,
    required this.selectedDateIndex,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final date = _getSelectedDate();

    // ================= NO SLOTS =================

    if (!date.hasSlots) {
      return _NoSlots(date: date.date);
    }

    // ================= HAS SLOTS =================

    return _AvailableSlots(
      date: date.date,
      selectedTime: selectedTime,
      onTimeSelected: onTimeSelected,
    );
  }

  DateItem _getSelectedDate() {
    const dates = [
      DateItem(
        date: 'Today, 23 Feb',
        slots: 'No slots available',
        hasSlots: false,
      ),
      DateItem(
        date: 'Tomorrow, 24 Feb',
        slots: '9 slots available',
        hasSlots: true,
      ),
      DateItem(
        date: 'Thu, 25 Feb',
        slots: '10 slots available',
        hasSlots: true,
      ),
    ];

    return dates[selectedDateIndex];
  }
}

// ======================================================
// DATE ITEM
// ======================================================

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

// ============================ NO SLOTS ======================== //

class _NoSlots extends StatelessWidget {
  final String date;

  const _NoSlots({required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ================= DATE && Result =================
        Center(
          child: CustomText(
            text: date,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            
          ),
        ),
        SizedBox(height: 8.h),
        CustomText(
          text: 'No slots available',
          fontSize: 14.sp,
          fontColor: greyTextColor,
        ),
        SizedBox(height: 16.h),
        // ================= NEXT AVAILABILITY && CONTACT =================
        CustomButton(
          text: 'Next availability on wed, 24 Feb',
          fontSize: 18.sp,
          radius: 6.r,
        ),
        SizedBox(height: 12.h),
        CustomText(text: 'OR', fontSize: 10.sp, fontColor: greyTextColor),
        SizedBox(height: 10.h),
        CustomButtonWithOutlineBorder(
          buttonText: 'Conatct Clinic',
          circularRadius: 6.r,
          fonstSize: 18.sp,
        ),
      ],
    );
  }
}

// ================== AVAILABLE SLOTS ====================== //
class _AvailableSlots extends StatelessWidget {
  final String date;
  final String? selectedTime;
  final ValueChanged<String> onTimeSelected;

  const _AvailableSlots({
    required this.date,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ================= DATE ================= //
        Center(
          child: CustomText(
            text: date,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),

        // ================= AFTERNOON =================
        _TimeSection(
          title: 'Afternoon 7 slots',
          times: const [
            '1:00 PM',
            '1:30 PM',
            '2:00 PM',
            '2:30 PM',
            '3:00 PM',
            '3:30 PM',
            '4:00 PM',
          ],
          selectedTime: selectedTime,
          onTimeSelected: onTimeSelected,
        ),

        SizedBox(height: 18.h),

        // ================= EVENING =================
        _TimeSection(
          title: 'Evening 5 slots',
          times: const ['5:00 PM', '5:30 PM', '6:00 PM', '6:30 PM', '7:00 PM'],
          selectedTime: selectedTime,
          onTimeSelected: onTimeSelected,
        ),
      ],
    );
  }
}

// ======================================================
// TIME SECTION
// ======================================================

class _TimeSection extends StatelessWidget {
  final String title;
  final List<String> times;
  final String? selectedTime;
  final ValueChanged<String> onTimeSelected;

  const _TimeSection({
    required this.title,
    required this.times,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ================= TITLE =================
        CustomText(
          text: title,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          
        ),

        SizedBox(height: 10.h),

        // ================= TIMES =================
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: times.map((time) {
            final isSelected = selectedTime == time;

            return GestureDetector(
              onTap: () => onTimeSelected(time),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 76.w,
                height: 40.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? primaryColor : const Color(0xffEAF8F4),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: CustomText(
                  text:time,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    fontColor: isSelected ? Colors.white : primaryColor,
                  
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
