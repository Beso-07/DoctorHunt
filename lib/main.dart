import 'package:doctorhunt/core/cache/cache_helper.dart';
import 'package:doctorhunt/core/di/service_locator.dart';
import 'package:doctorhunt/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  
  await CacheHelper.init();
  runApp(DoctorHunt());
}

class DoctorHunt extends StatelessWidget {
  const DoctorHunt({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Otama.ep',
        ),
      ),
    );
  }
}
