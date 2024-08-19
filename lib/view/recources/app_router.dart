import 'package:boost_test/view/home/home.dart';
import 'package:boost_test/view/login/login.dart';
import 'package:boost_test/view/splash.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';





class RoutePaths{

  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';

}


class AppRouter{

  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: RoutePaths.splash,
    routes: [
         GoRoute(
        name: RoutePaths.splash,
        path: RoutePaths.splash,
        builder: (context, state) => const SplashView(),
      ),
      
      
      GoRoute(
        name: RoutePaths.login,
        path: RoutePaths.login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        name: RoutePaths.home,
        path: RoutePaths.home,
        builder: (context, state) => const HomeView(),
        // routes: [
          // GoRoute(
          //     name: RoutePaths.productDetails,
          //     path: RoutePaths.productDetails,
          //     builder: (context, state) =>  productDetails(studentId: int.tryParse(state.uri.queryParameters['studentId'] ??''),),
          // ),
       
        // ]
      ),
    ],
  );
}