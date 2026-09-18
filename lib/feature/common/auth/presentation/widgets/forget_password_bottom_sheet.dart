import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:doctorhunt/core/validator/app_validator.dart';
import 'package:doctorhunt/core/widgets/custom_button.dart';
import 'package:doctorhunt/core/widgets/default_text_field.dart';
import 'package:go_router/go_router.dart';
import 'enter_code_bottom_sheet.dart';

class ForgotPasswordBottomSheet extends StatefulWidget {
  const ForgotPasswordBottomSheet({super.key});

  @override
  State<ForgotPasswordBottomSheet> createState() => _ForgotPasswordBottomSheetState();
}

class _ForgotPasswordBottomSheetState extends State<ForgotPasswordBottomSheet> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void submit() {
    if (!formKey.currentState!.validate()) return;

    context.pop(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const EnterCodeBottomSheet(),
      ),
    );
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
              text: 'Forgot password',
              fontSize: 19.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: height * 0.012),
            CustomText(
              text: 'Enter your email for the verification processs,we will send 4 digits code to your email.',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontColor: const Color(0xff677294),
            ),
            SizedBox(height: height * 0.04),
            DefaultTextField(
              controller: emailController,
              hintText: 'Email',
              height: 50,
              textInputType: TextInputType.emailAddress,
              validator: AppValidator.validateEmail,
            ),
            SizedBox(height: height * 0.03),
            CustomButton(
              text: 'Continue',
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