
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',

  routes: [
    //================= Splash =================
    //GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
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
    // GoRoute(
    //   path: '/mainLayout',
    //   builder: (context, state) => MultiBlocProvider(
    //     providers: [
    //       BlocProvider(create: (_) => locator<HomeCubit>()..loadHome()),
    //       BlocProvider(create: (_) => locator<SearchCubit>()),
    //       BlocProvider(create: (_) => locator<MoviesCubit>()),
    //       BlocProvider(create: (_) => locator<DiscoverCubit>()),
    //       BlocProvider(create: (_) => locator<ListsCubit>()),
    //     ],
    //     child: const MainLayout(),
    //   ),
    // ),
    
  ],
);
