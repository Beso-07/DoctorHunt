import 'dart:ui';
import 'package:doctorhunt/core/enums/user_role.dart';
import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:doctorhunt/core/utils/app_snackbar.dart';
import 'package:doctorhunt/core/validator/app_validator.dart';
import 'package:doctorhunt/core/widgets/custom_button.dart';
import 'package:doctorhunt/core/widgets/default_text_field.dart';
import 'package:doctorhunt/feature/common/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:doctorhunt/feature/common/auth/presentation/widgets/auth_header.dart';
import 'package:doctorhunt/feature/common/auth/presentation/widgets/forget_password/forgot_password_sheet_flow.dart';
import 'package:doctorhunt/feature/common/auth/presentation/widgets/social_auth_buttons.dart';
import 'package:doctorhunt/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  final UserRole role;
  const LoginScreen({super.key, this.role = UserRole.patient});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    context.read<AuthBloc>().add(
      LoginEvent(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess || state is LoginWithGoogleSuccess) {
          AppSnackBar.success(context, 'You logged in successfully');
          if (widget.role == UserRole.admin) {
            AdminBottomBarRoute().go(context);
          } else {
            PatientBottomBarRoute().go(context);
          }
        } else if (state is LoginError) {
          AppSnackBar.error(context, state.message);
        } else if (state is LoginWithGoogleError) {
          AppSnackBar.error(context, state.message);
        }
      },
      builder: (context, state) {
        final isLoading =
            state is LoginLoading || state is LoginWithGoogleLoading;

        return Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 35.h,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.08),

                        // ================= HEADER =================
                        const AuthHeader(title: 'Welcome back'),
                        SizedBox(height: height * 0.06),

                        // ================= SOCIAL BUTTONS =================
                        const SocialAuthButtons(),
                        SizedBox(height: height * 0.03),

                        // ================= EMAIL =================
                        DefaultTextField(
                          controller: emailController,
                          hintText: 'Email',
                          textInputType: TextInputType.emailAddress,
                          height: 50,
                          validator: AppValidator.validateEmail,
                        ),
                        SizedBox(height: height * 0.016),

                        // ================= PASSWORD =================
                        DefaultTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          isPassword: true,
                          height: 50,
                          validator: AppValidator.validatePassword,
                        ),
                        SizedBox(height: height * 0.03),

                        // ================= LOGIN =================
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                          ),
                          child: CustomButton(
                            text: 'Login',
                            height: 50.h,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            radius: 12.r,
                            onTap: login,
                          ),
                        ),

                        SizedBox(height: height * 0.02),

                        // ================= FORGOT PASSWORD =================
                        GestureDetector(
                          onTap: () => ForgotPasswordSheetFlow.show(context),
                          child: CustomText(
                            text: 'Forgot password',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            fontColor: primaryColor,
                          ),
                        ),

                        SizedBox(height: height * 0.23),

                        // ================= SIGN UP ROW =================
                        if (widget.role == UserRole.patient) ...[
                          GestureDetector(
                            onTap: () {
                              SignupRoute().push(context);
                            },
                            child: CustomText(
                              text: "Don't have an account? ",
                              secondText: 'Join us',
                              fontSize: 12.sp,
                              fontColor: greyColorText,
                              secondColor: primaryColor,
                            ),
                          ),
                          SizedBox(height: height * 0.05),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),

            if (isLoading)
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
