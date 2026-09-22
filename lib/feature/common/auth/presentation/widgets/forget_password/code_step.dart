import 'package:doctorhunt/feature/common/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:doctorhunt/core/widgets/custom_button.dart';
import 'package:doctorhunt/core/widgets/default_text_field.dart';

class CodeStep extends StatefulWidget {
  final String userEmail;
  const CodeStep({super.key, required this.userEmail});

  @override
  State<CodeStep> createState() => CodeStepState();
}

class CodeStepState extends State<CodeStep> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final otpCode = _controllers.map((c) => c.text).join();
      context.read<AuthBloc>().add(
            VerifyPasswordOtpEvent(
              email: widget.userEmail,
              token: otpCode,
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
            text: 'Enter 4 Digits Code',
            fontSize: 19.sp,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 10.h),
          CustomText(
            text: 'Enter the 4 digits code that you received on your email.',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            fontColor: const Color(0xff677294),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) {
              return SizedBox(
                width: 54.w,
                child: DefaultTextField(
                  hintText: "",
                  textAlign: TextAlign.center,
                  controller: _controllers[index],
                  textInputType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) return '';
                    return null;
                  },
                  onChanged: (value) {
                    if (value.isNotEmpty && index < 3) {
                      FocusScope.of(context).nextFocus();
                    } else if (value.isEmpty && index > 0) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                ),
              );
            }),
          ),
          const Spacer(),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return CustomButton(
                text: state is VerifyPasswordOtpLoading ? 'Verifying...' : 'Continue',
                height: 50.h,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                radius: 12.r,
                onTap: state is VerifyPasswordOtpLoading ? null : _submit,
              );
            },
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}