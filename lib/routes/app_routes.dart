import 'package:flutter/material.dart';
import 'package:jignect_app_11jan23/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:jignect_app_11jan23/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:jignect_app_11jan23/presentation/splash_screen/splash_screen.dart';
import 'package:jignect_app_11jan23/presentation/intro_screen/intro_screen.dart';
import 'package:jignect_app_11jan23/presentation/login_screen/login_screen.dart';
import 'package:jignect_app_11jan23/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String introScreen = '/intro_screen';

  static const String loginScreen = '/login_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String dashboardScreen = '/dashboard_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: SplashScreen.builder,
        introScreen: IntroScreen.builder,
        loginScreen: LoginScreen.builder,
        signUpScreen: SignUpScreen.builder,
        // dashboardScreen: DashboardScreen.builder,
        // dashboardScreen: DashboardScreen().build(),
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}
