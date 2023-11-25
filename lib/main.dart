import 'package:flutter/material.dart';
import 'package:hackaton/src/features/auth/profile/profile.dart';
import 'src/features/auth/splash_screen/splash_screen.dart';
import 'src/features/auth/onboarding_screens/onboarding.dart';
import 'src/features/auth/register_screen/register.dart';
import 'src/features/auth/register_screen/role.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/session_1/onboarding': (context) => const OnBoarding(),
        '/session_2/register': (context) => const Register(),
        '/profile': (context) => const Profile(),
      },
    );
  }
}