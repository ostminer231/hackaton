import 'package:flutter/material.dart';
import 'package:hackaton/src/features/auth/profile/profile.dart';
import 'package:hackaton/src/features/auth/register_screen/forgot_password.dart';
import 'src/features/auth/splash_screen/splash_screen.dart';
import 'src/features/auth/onboarding_screens/onboarding.dart';
import 'src/features/auth/register_screen/register.dart';
import 'src/features/auth/register_screen/role.dart';
import 'src/features/auth/register_screen/forgot_password.dart';
import 'src/features/auth/login_screens/login.dart';
import 'src/features/auth/register_screen/OTP_Verification.dart';


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
        //'/profile': (context) => const Profile(),
        '/forgot_password': (context) => const ForgotPasswordPage(),
        '/login_page': (context) => const Login(),
        '/role_page': (context) => const RoleScreen(),
        '/otp_verification': (context) => const OTP_Verification_page(),
      },
    );
  }
}