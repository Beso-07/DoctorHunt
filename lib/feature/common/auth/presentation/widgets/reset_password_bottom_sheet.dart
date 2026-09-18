import 'package:doctorhunt/core/utils/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:doctorhunt/core/validator/app_validator.dart';
import 'package:doctorhunt/core/widgets/custom_button.dart';
import 'package:doctorhunt/core/widgets/default_text_field.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordBottomSheet extends StatefulWidget {
  const ResetPasswordBottomSheet({super.key});

  @override
  State<ResetPasswordBottomSheet> createState() =>
      _ResetPasswordBottomSheetState();
}

class _ResetPasswordBottomSheetState extends State<ResetPasswordBottomSheet> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void submit() {
    if (!formKey.currentState!.validate()) return;

    context.pop(context);
    AppSnackBar.success(context, 'Password updated successfully');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 130.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: const Color(0xffC4C4C4),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            CustomText(
              text: 'Reset Password',
              fontSize: 19.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: height * 0.012),
            CustomText(
              text:
                  'Set the new password for your account so you can\nlogin and access all the features.',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontColor: const Color(0xff677294),
            ),
            SizedBox(height: height * 0.025),
            DefaultTextField(
              controller: newPasswordController,
              hintText: 'New Password',
              isPassword: true,
              height: 50,
              validator: AppValidator.validatePassword,
            ),
            SizedBox(height: height * 0.015),
            DefaultTextField(
              controller: confirmPasswordController,
              hintText: 'Re-enter Password',
              isPassword: true,
              height: 50,
              validator: (val) => AppValidator.confirmPassword(
                value: val,
                password: newPasswordController.text,
              ),
            ),
            SizedBox(height: height * 0.03),
            CustomButton(
              text: 'Update Password',
              height: 50.h,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              radius: 12.r,
              onTap: submit,
            ),
            SizedBox(height: height * 0.03),
          ],
        ),
      ),
    );
  }
}
