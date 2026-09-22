import 'package:doctorhunt/feature/common/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:doctorhunt/core/validator/app_validator.dart';
import 'package:doctorhunt/core/widgets/custom_button.dart';
import 'package:doctorhunt/core/widgets/default_text_field.dart';

class EmailStep extends StatefulWidget {
  final ValueChanged<String> onEmailSubmitted;
  const EmailStep({super.key, required this.onEmailSubmitted});

  @override
  State<EmailStep> createState() => _EmailStepState();
}

class _EmailStepState extends State<EmailStep> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      widget.onEmailSubmitted(email);
      context.read<AuthBloc>().add(ForgetPasswordEvent(email: email));
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
            text: 'Forgot password',
            fontSize: 19.sp,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 10.h),
          CustomText(
            text: 'Enter your email for the verification process, we will send a 4-digit code to your email.',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            fontColor: const Color(0xff677294),
          ),
          SizedBox(height: 20.h),
          DefaultTextField(
            controller: _emailController,
            hintText: 'Email',
            height: 50,
            textInputType: TextInputType.emailAddress,
            validator: AppValidator.validateEmail,
          ),
          const Spacer(),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return CustomButton(
                text: state is ForgetPasswordLoading ? 'Sending...' : 'Continue',
                height: 50.h,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                radius: 12.r,
                onTap: state is ForgetPasswordLoading ? null : _submit,
              );
            },
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}