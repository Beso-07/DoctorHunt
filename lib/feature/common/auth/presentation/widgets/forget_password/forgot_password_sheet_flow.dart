import 'package:doctorhunt/feature/common/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:doctorhunt/core/utils/app_snackbar.dart';
import 'package:doctorhunt/feature/common/auth/presentation/widgets/forget_password/code_step.dart';
import 'package:doctorhunt/feature/common/auth/presentation/widgets/forget_password/email_step.dart';
import 'package:doctorhunt/feature/common/auth/presentation/widgets/forget_password/reset_password_step.dart';

class ForgotPasswordSheetFlow extends StatefulWidget {
  const ForgotPasswordSheetFlow({super.key});

  static Future<void> show(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BlocProvider.value(
        value: authBloc,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const ForgotPasswordSheetFlow(),
        ),
      ),
    );
  }

  @override
  State<ForgotPasswordSheetFlow> createState() => _ForgotPasswordSheetFlowState();
}

class _ForgotPasswordSheetFlowState extends State<ForgotPasswordSheetFlow> {
  late final PageController _pageController;
  int _currentPage = 0;
  String _userEmail = '';

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextStep() {
    FocusScope.of(context).unfocus();
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          _nextStep();
        } else if (state is VerifyPasswordOtpSuccess) {
          _nextStep();
        } else if (state is ResetPasswordSuccess) {
          context.pop();
          AppSnackBar.success(context, 'Password updated successfully');
        } else if (state is ForgetPasswordError) {
          AppSnackBar.error(context, state.message);
        } else if (state is VerifyPasswordOtpError) {
          AppSnackBar.error(context, state.message);
        } else if (state is ResetPasswordError) {
          AppSnackBar.error(context, state.message);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            SizedBox(height: 20.h),
            AnimatedSize(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              child: SizedBox(
                height: _getStepHeight(_currentPage),
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) => setState(() => _currentPage = index),
                  children: [
                    EmailStep(
                      onEmailSubmitted: (email) {
                        _userEmail = email;
                      },
                    ),
                    CodeStep(userEmail: _userEmail),
                    const ResetPassword(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getStepHeight(int index) {
    switch (index) {
      case 0:
        return 280.h;
      case 1:
        return 270.h;
      case 2:
        return 340.h;
      default:
        return 300.h;
    }
  }
}