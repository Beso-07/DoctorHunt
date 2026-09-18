import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/utils/app_snackbar.dart';
import 'package:doctorhunt/core/validator/app_validator.dart';
import 'package:doctorhunt/core/widgets/custom_button.dart';
import 'package:doctorhunt/core/widgets/default_text_field.dart';
import 'package:doctorhunt/feature/common/auth/presentation/widgets/auth_header.dart';
import 'package:doctorhunt/feature/common/auth/presentation/widgets/social_auth_buttons.dart';
import 'package:doctorhunt/feature/common/auth/presentation/widgets/terms_checkbox.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool acceptedTerms = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signup() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (!acceptedTerms) {
      AppSnackBar.warning(context, 'Please agree to the Terms of Service & Privacy Policy');
      return;
    }

    AppSnackBar.success(context, 'Accounted created successfully.');
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
          child: Form(
            key: formKey,
            child: Column(
              children: [
               SizedBox(height: height * 0.1), 

                // ================= HEADER =================
                const AuthHeader(title: 'Join us to start searching'),
                SizedBox(height: height * 0.06),

                // ================= SOCIAL =================
                SocialAuthButtons(),
                SizedBox(height: height * 0.04),
                
                // ================= NAME =================
                DefaultTextField(
                  controller: nameController,
                  hintText: 'Name',
                  height: 50,
                  textInputType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.016),

                // ================= EMAIL =================
                DefaultTextField(
                  controller: emailController,
                  hintText: 'Email',
                  height: 50,
                  textInputType: TextInputType.emailAddress,
                  validator: AppValidator.validateEmail,
                ),
                SizedBox(height: height * 0.016),

                // ================= PASSWORD =================
                DefaultTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  height: 50,
                  isPassword: true,
                  validator: AppValidator.validatePassword,
                ),
                SizedBox(height: height * 0.016),

                // ================= TERMS =================
                TermsCheckbox(
                  value: acceptedTerms,
                  onChanged: (value) {
                    setState(() {
                      acceptedTerms = value ?? false;
                    });
                  },
                ),
                SizedBox(height: height * 0.03),

                // ================= SIGN UP =================
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomButton(
                    text: 'Sign up',
                    height: 50.h,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    radius: 10.r,
                    onTap: signup,
                  ),
                ),
                SizedBox(height: height * 0.02),

                // ================= LOGIN ROW =================
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: CustomText(
                    text: 'Have an account? ',
                    secondText: 'Log in',
                    fontSize: 14.sp,
                    fontColor: primary,
                    secondColor: primaryColor,
                  ),
                ),
                SizedBox(height: height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
