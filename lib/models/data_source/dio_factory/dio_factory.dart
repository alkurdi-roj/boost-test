import 'package:boost_test/app/app_perefernces.dart';
import 'package:boost_test/app/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'dio_interceptor.dart';


class DioFactory {
  final AppPreferences _appPreferences;

  DioFactory(this._appPreferences);


  Future<Dio> getDio() async {
    Dio dio = Dio();
    Duration timeOut = const Duration(seconds: 60);
    Map<String, String> headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': _appPreferences.getUserToken(),

    };
    dio.options = BaseOptions(
      baseUrl: Constant.baseUrl,
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
      headers: headers,
    );
    dio.interceptors.add(GeneralInterceptor());
    if (kReleaseMode) {
      if (kDebugMode) {
        print('release mode no logs');
      }
    } else {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        responseHeader: true,
        requestBody: true,
        request: true,
        responseBody: true,
      ));
    }
    return dio;
  }
}
