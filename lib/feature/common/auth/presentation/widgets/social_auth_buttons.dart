import 'package:doctorhunt/feature/common/auth/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialAuthButtons extends StatelessWidget {
  const SocialAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SocialButton(
          title: 'Google',
          iconPath: 'assets/images/google_icon.svg',
          onTap: () {
            // Google Login
          },
        ),

        SizedBox(width: 12.w),

        SocialButton(
          title: 'Facebook',
          iconPath: 'assets/images/facebook_icon.svg',
          onTap: () {
            // Facebook Login
          },
        ),
      ],
    );
  }
}