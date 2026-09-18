import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:doctorhunt/core/widgets/custom_button.dart';
import 'package:doctorhunt/feature/common/onboarding/data/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  int currentIndex = 0;

  final List<OnboardingModel> onboardingData = const [
    OnboardingModel(
      title: 'Find Trusted Doctors',
      sub:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
      png: 'assets/images/img1.png',
      svg: 'assets/images/circle1.svg',
    ),
    OnboardingModel(
      title: 'Choose Best Doctors',
      sub:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
      png: 'assets/images/img2.png',
      svg: 'assets/images/circle2.svg',
    ),
    OnboardingModel(
      title: 'Easy Appointments',
      sub:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
      png: 'assets/images/img3.png',
      svg: 'assets/images/circle1.svg',
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentIndex < onboardingData.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go('/choose-role');
    }
  }

  void skip() {
    context.go('/choose-role');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView.builder(
          controller: _controller,
          itemCount: onboardingData.length,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            final item = onboardingData[index];
            final isLast = index == onboardingData.length - 1;

            return Stack(
              children: [
                // Green SVG
                Positioned(
                  top: -5,
                  left: index == 1 ? null : -5,
                  right: index == 1 ? -5 : null,
                  child: SizedBox(
                    width: size.width * .68,
                    height: size.width * .68,
                    child: SvgPicture.asset(item.svg, fit: BoxFit.fill),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * .055),

                      // Image
                      ClipOval(
                        child: Image.asset(
                          item.png,
                          width: size.width * .9,
                          height: size.width * .85,
                          fit: BoxFit.cover,
                        ),
                      ),

                      SizedBox(height: 32.h),

                      // Title
                      CustomText(
                        text: item.title,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 16.h),

                      // Subtitle
                      CustomText(
                        text: item.sub,
                        fontSize: 14,
                        fontColor: greyTextColor,
                        textAlign: TextAlign.center,
                      ),

                      const Spacer(),

                      // Button
                      CustomButton(
                        text: isLast ? 'Get Started' : 'Next',
                        onTap: nextPage,
                      ),

                      SizedBox(height: 16.h),

                      // Skip
                      GestureDetector(
                        onTap: skip,
                        child: CustomText(
                          text: 'Skip',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontColor: greyTextColor,
                        ),
                      ),

                      SizedBox(height: 32.h),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
