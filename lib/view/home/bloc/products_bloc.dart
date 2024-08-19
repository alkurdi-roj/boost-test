import 'package:bloc/bloc.dart';
import 'package:boost_test/app/dependency_injection.dart';
import 'package:boost_test/models/data_source/app_api/app_api.dart';
import 'package:boost_test/models/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/dio.dart';

part 'products_event.dart';
part 'products_state.dart';


class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  AppServiceClient appServiceClient = instance<AppServiceClient>();
  ProductsBloc() : super(ProductsState.initial()) {
    on<GetProductsEvent>((event, emit) async {
      // emit(state.copyWith(menuStateStatus: MenuStateStatus.loading));
      try {
        HttpResponse<ProductsModel> res = await appServiceClient.products();
        if (res.response.statusCode == 200 || res.response.statusCode == 201) {
          emit(state.copyWith(
              productsStateStatus: ProductsStateStatus.success,
              productsData: res.data ));
        } else {
          emit(state.copyWith(
              productsStateStatus: ProductsStateStatus.error,
              errorMessage: "there is an error"));
        }
      }on DioException catch (e) {
        if(e.response?.statusCode == 404){
          emit(state.copyWith(isStatusCode404: true));
        }
        emit(state.copyWith(
            productsStateStatus: ProductsStateStatus.error,
            errorMessage: FailureModel.fromJson(
                e.response?.data.runtimeType == String
                    ? defaultError
                    : e.response?.data ?? defaultError).message));
      }
      catch (e) {
              emit(state.copyWith(
              productsStateStatus: ProductsStateStatus.error,
          ));
      }
    });
  }
}


