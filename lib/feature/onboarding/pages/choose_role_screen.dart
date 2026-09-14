import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:doctorhunt/core/widgets/custom_button.dart';
import 'package:doctorhunt/feature/onboarding/widgets/role_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  String selectedRole = 'Patient';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 25.h),

              // Logo
              SvgPicture.asset('assets/images/logo.svg'),

              SizedBox(height: 32.h),

              CustomText(text: 'Choose your role', fontSize: 26.sp),

              SizedBox(height: 12.h),

              CustomText(
                text:
                    'The selected role determines the experience and\navailable features.',
                fontColor: greyTextColor,
                fontSize: 12.sp,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 26.h),

              // Patient
              RoleCard(
                title: 'Patient',
                description:
                    'Find doctors, book appointments,\nand manage your medical records.',
                imagePath: 'assets/images/patient_icon.png',
                selected: selectedRole == 'Patient',
                onTap: () {
                  setState(() {
                    selectedRole = 'Patient';
                  });
                },
              ),

              SizedBox(height: 16.h),

              // Admin
              RoleCard(
                title: 'Admin',
                description:
                    'Manage doctors, appointments,\nusers, and the platform.',
                imagePath: 'assets/images/admin_icon.png' ,
                selected: selectedRole == 'Admin',
                onTap: () {
                  setState(() {
                    selectedRole = 'Admin';
                  });
                },
              ),

              const Spacer(),

              CustomButton(text: 'Continue'),

              SizedBox(height: 25.h),
            ],
          ),
        ),
      ),
    );
  }
}


