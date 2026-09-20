import 'package:doctorhunt/core/di/service_locator.dart';
import 'package:doctorhunt/core/enums/user_role.dart';
import 'package:doctorhunt/feature/common/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:doctorhunt/feature/common/onboarding/pages/choose_role_screen.dart';
import 'package:doctorhunt/feature/common/onboarding/pages/onboarding_screen.dart';
import 'package:doctorhunt/feature/common/splash/splash_screen.dart';
import 'package:doctorhunt/feature/patient/home/presentation/pages/patient_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:doctorhunt/feature/common/auth/presentation/pages/login_screen.dart';
import 'package:doctorhunt/feature/common/auth/presentation/pages/signup_screen.dart';
import 'package:doctorhunt/feature/common/bottom_bar/presentation/pages/patient_bottom_bar.dart';
import 'package:doctorhunt/feature/patient/doctor_details/presentation/pages/doctor_details_screen.dart';
import 'package:doctorhunt/feature/patient/doctor_details/presentation/pages/select_time_screen.dart';

part 'app_router.g.dart';

// ================= Splash =================
@TypedGoRoute<SplashRoute>(path: '/')
class SplashRoute extends GoRouteData with $SplashRoute {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SplashScreen();
}

// ================= Onboarding =================
@TypedGoRoute<OnboardingRoute>(path: '/onboarding')
class OnboardingRoute extends GoRouteData with $OnboardingRoute {
  const OnboardingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OnboardingScreen();
}

@TypedGoRoute<ChooseRoleRoute>(path: '/choose-role')
class ChooseRoleRoute extends GoRouteData with $ChooseRoleRoute {
  const ChooseRoleRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ChooseRoleScreen();
}

// ================= Auth =================
@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  final UserRole role;
  const LoginRoute({this.role = UserRole.patient}); 
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => locator<AuthBloc>(),
      child:  LoginScreen(role:role),
    );
  }
}

@TypedGoRoute<SignupRoute>(path: '/signup')
class SignupRoute extends GoRouteData with $SignupRoute {
  const SignupRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => locator<AuthBloc>(),
      child: const SignupScreen(),
    );
  }
}

// ================= Main Layout =================
@TypedGoRoute<PatientBottomBarRoute>(path: '/patient-bottom-bar')
class PatientBottomBarRoute extends GoRouteData with $PatientBottomBarRoute {
  const PatientBottomBarRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => PatientBottomBar();
}

// ================= Home & Patient =================
@TypedGoRoute<PatientHomeRoute>(path: '/patient-home-screen')
class PatientHomeRoute extends GoRouteData with $PatientHomeRoute {
  const PatientHomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PatientHomeScreen();
}

@TypedGoRoute<DoctorDetailsRoute>(path: '/doctor-details')
class DoctorDetailsRoute extends GoRouteData with $DoctorDetailsRoute {
  const DoctorDetailsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DoctorDetailsScreen();
}

@TypedGoRoute<SelectTimeRoute>(path: '/select-time')
class SelectTimeRoute extends GoRouteData with $SelectTimeRoute {
  const SelectTimeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SelectTimeScreen();
}

// ================= Router Instance =================
final GoRouter appRouter = GoRouter(
  initialLocation: const SplashRoute().location,
  routes: $appRoutes,
);
