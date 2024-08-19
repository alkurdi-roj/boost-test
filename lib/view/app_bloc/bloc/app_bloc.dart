import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:boost_test/app/app_perefernces.dart';
import 'package:boost_test/app/dependency_injection.dart';
import 'package:boost_test/models/data_source/app_api/app_api.dart';
import 'package:boost_test/models/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shared_preferences/shared_preferences.dart';



part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  late AppPreferences appPreferences;
  late AppServiceClient appServiceClient;

  AppBloc() : super(AppState.initial()) {
    on<CheckLoggedInEvent>((event, emit) {
      appPreferences = instance<AppPreferences>();
      if (appPreferences.getUserToken() == '') {
        emit(state.copyWith(isUserLoggedIn: false));
      } else {
        emit(state.copyWith(
            isUserLoggedIn: true,
            userData: appPreferences.getUserData()));

     
      }
    });



  }
}
