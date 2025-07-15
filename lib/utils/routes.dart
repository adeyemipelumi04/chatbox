// ignore_for_file: non_constant_identifier_names

import 'package:chatbox_app/screens/auth/log_in.dart';
import 'package:chatbox_app/screens/auth/sign_up.dart';
import 'package:chatbox_app/screens/home/home.dart';
import 'package:chatbox_app/screens/splash/onboarding.dart';
import 'package:chatbox_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => LoginScreen(),
    home: (context) => const HomeScreen(),
    signUp: (context) => SignUpScreen(),
    onboarding: (context) => const OnboardingPage(),
  };

  static String splash = '/';
  static String login = '/login';
  static String home = '/home';
  static String signUp = '/signup';
  static String onboarding = '/onboarding';
}
