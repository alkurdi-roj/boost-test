

import 'dart:async';

import 'package:boost_test/view/recources/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralInterceptor extends Interceptor {


  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {

    return handler.next(response);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    Timer(const Duration(seconds: 2), () async {
      if (err.response?.statusCode == 403) {
        showToast(message: err.response?.statusMessage ?? "Defaul Errro");
        BuildContext? context = AppRouter.router.configuration.navigatorKey.currentContext;
        // context?.read<AppBloc>().add(LogOutEvent());
        context?.goNamed(RoutePaths.login);
      }
    });
    return handler.next(err);
  }
}
