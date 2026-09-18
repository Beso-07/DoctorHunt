import 'package:doctorhunt/feature/common/bottom_bar/presentation/pages/patient_bottom_bar.dart';
import 'package:doctorhunt/feature/patient/doctor_details/presentation/pages/doctor_details_screen.dart';
import 'package:doctorhunt/feature/patient/doctor_details/presentation/pages/select_time_screen.dart';
import 'package:doctorhunt/feature/patient/home/presentation/pages/patient_home_screen.dart';
import 'package:doctorhunt/feature/common/onboarding/pages/choose_role_screen.dart';
import 'package:doctorhunt/feature/common/onboarding/pages/onboarding_screen.dart';
import 'package:doctorhunt/feature/common/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',

  routes: [
    //================= Splash =================
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    //================= Onboarding =================
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/choose-role',
      builder: (context, state) => const ChooseRoleScreen(),
    ),
    //================= AUTH SHELL =================
    // ShellRoute(
    //   builder: (context, state, child) =>
    //       BlocProvider(create: (_) => locator<AuthCubit>(), child: child),
    //   routes: [
    //     GoRoute(
    //       path: '/login',
    //       builder: (context, state) => const LoginScreen(),
    //     ),

    //     GoRoute(
    //       path: '/signup',
    //       builder: (context, state) => const SignupScreen(),
    //     ),

    //     GoRoute(
    //       path: '/forgetPassword',
    //       builder: (context, state) => const ForgetPasswordScreen(),
    //     ),
    //     GoRoute(path: '/otp', builder: (context, state) => const OtpScreen()),
    //     GoRoute(
    //       path: '/resetPassword',
    //       builder: (context, state) => const ResetPasswordScreen(),
    //     ),
    //   ],
    // ),

    // ================= Main Layout =================
    GoRoute(path: '/patient_bottom_bar', builder: (context, state) => PatientBottomBar()),

    // ================= Home ================= //
    GoRoute(path: '/patient_home_screen', builder: (context, state) => const PatientHomeScreen()),
    GoRoute(path: '/doctor-details', builder: (context, state) => const DoctorDetailsScreen()),
    GoRoute(path: '/select-time', builder: (context, state) => const SelectTimeScreen()),
  ],
);
