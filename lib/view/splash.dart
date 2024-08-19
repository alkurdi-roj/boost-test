import 'dart:async';

import 'package:boost_test/view/app_bloc/bloc/app_bloc.dart';
import 'package:boost_test/view/recources/app_router.dart';
import 'package:boost_test/view/recources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context2, state) {
        Timer(const Duration(seconds: 2), () {
          if (state.isUserLoggedIn) {
              context.goNamed(RoutePaths.home);     
          } else {
            context.goNamed(RoutePaths.login);
          }
        });
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizeW.s48),
            child: Text('Splash screen'),
          )),
        );
      },
    );
  }
}
