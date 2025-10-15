import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/demo_splash_screen.dart';
import 'screens/demo_auth_screen.dart';
import 'screens/demo_home_screen.dart';
import 'screens/demo_admin_screen.dart';

void main() {
  runApp(const RakshaIrelandDemoApp());
}

class RakshaIrelandDemoApp extends StatelessWidget {
  const RakshaIrelandDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Raksha Ireland - Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.red,
            primaryColor: const Color(0xFFE53E3E),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFFE53E3E),
              brightness: Brightness.light,
            ),
            textTheme: GoogleFonts.robotoTextTheme(
              Theme.of(context).textTheme,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE53E3E),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: 32.w,
                  vertical: 16.h,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Color(0xFFE53E3E), width: 2),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
            ),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const DemoSplashScreen(),
            '/auth': (context) => const DemoAuthScreen(),
            '/home': (context) => const DemoHomeScreen(),
            '/admin': (context) => const DemoAdminScreen(),
          },
        );
      },
    );
  }
}