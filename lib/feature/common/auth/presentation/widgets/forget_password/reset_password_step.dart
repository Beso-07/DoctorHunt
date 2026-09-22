import 'package:doctorhunt/feature/common/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:doctorhunt/core/validator/app_validator.dart';
import 'package:doctorhunt/core/widgets/custom_button.dart';
import 'package:doctorhunt/core/widgets/default_text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => ResetPasswordState();
}

class ResetPasswordState extends State<ResetPassword> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            ResetPasswordEvent(
              newPassword: _newPasswordController.text.trim(),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Reset Password',
            fontSize: 19.sp,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 10.h),
          CustomText(
            text: 'Set the new password for your account so you can login and access all the features.',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            fontColor: const Color(0xff677294),
          ),
          SizedBox(height: 20.h),
          DefaultTextField(
            controller: _newPasswordController,
            hintText: 'New Password',
            isPassword: true,
            height: 50,
            validator: AppValidator.validatePassword,
          ),
          SizedBox(height: 12.h),
          DefaultTextField(
            controller: _confirmPasswordController,
            hintText: 'Re-enter Password',
            isPassword: true,
            height: 50,
            validator: (val) => AppValidator.confirmPassword(
              value: val,
              password: _newPasswordController.text,
            ),
          ),
          const Spacer(),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return CustomButton(
                text: state is ResetPasswordLoading ? 'Updating...' : 'Update Password',
                height: 50.h,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                radius: 12.r,
                onTap: state is ResetPasswordLoading ? null : _submit,
              );
            },
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}