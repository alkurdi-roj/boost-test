import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:boost_test/app/app_perefernces.dart';
import 'package:boost_test/models/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:retrofit/dio.dart';

import '../../../app/dependency_injection.dart';
import '../../../models/data_source/app_api/app_api.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AppServiceClient appServiceClient = instance<AppServiceClient>();
  AppPreferences appPreferences = instance<AppPreferences>();

  LoginBloc() : super(LoginState.init()) {
    on<NormalLoginEvent>((event, emit) async {
      emit(state.copyWith(loginStateStatus: LoginStateStatus.loading));

      try {
        HttpResponse<LoginModel> res = await appServiceClient.login(
          username: event.userName,

          password: event.password,
        
        );

        if (res.response.statusCode == 200 || res.response.statusCode == 201) {
          emit(state.copyWith(
            loginStateStatus: LoginStateStatus.success,
            // user: res.data.data,
          ));
          appPreferences.setUserToken(res.data.token);
          appPreferences.setUserData(res.data);
        } else {
          emit(state.copyWith(
            loginStateStatus: LoginStateStatus.error,
            errorMessage: "error happened",
          ));
        }
      } on DioException catch (e) {
        emit(state.copyWith(
          loginStateStatus: LoginStateStatus.error,
          errorMessage: FailureModel.fromJson(
            e.response?.data.runtimeType == String
                ? defaultError
                : e.response?.data ?? defaultError,
          ).message,
        ));
      } catch (e) {
        emit(state.copyWith(
          loginStateStatus: LoginStateStatus.error,
        ));
      }
    });
  }

}
