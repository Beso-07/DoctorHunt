import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:doctorhunt/feature/doctor_details/presentation/widgets/doctor_info_card.dart';
import 'package:doctorhunt/feature/doctor_details/presentation/widgets/select_date_list.dart';
import 'package:doctorhunt/feature/doctor_details/presentation/widgets/time_slots.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SelectTimeScreen extends StatefulWidget {
  const SelectTimeScreen({super.key});

  @override
  State<SelectTimeScreen> createState() => _SelectTimeScreenState();
}

class _SelectTimeScreenState extends State<SelectTimeScreen> {
  int selectedDateIndex = 0;
  String? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // =================== AppBar =================== //
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        width: 38.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: greyBG),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 17.sp,
                          color: greyIconColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 14.w),
                    CustomText(
                      text: 'Select Time',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    
                  ],
                ),
                 SizedBox(height: 20.h),
                
                // =================== Doctor Info Card =================== //
                DoctorInfoCard(isSelectTime: true,),
                SizedBox(height: 20.h),

                // =================== Dates =================== //

                SelectDateList(
                  selectedIndex: selectedDateIndex,
                  onDateSelected: (index) {
                    setState(() {
                      selectedDateIndex = index;
                      selectedTime = null;
                    });
                  },
                ),

                SizedBox(height: 18.h),

                // =================== Time Slots =================== //

                TimeSlots(
                  selectedDateIndex: selectedDateIndex,
                  selectedTime: selectedTime,
                  onTimeSelected: (time) {
                    setState(() {
                      selectedTime = time;
                    });
                  },
                ),
              ],
            ),),
        ),
      ),
    );
  }
}
