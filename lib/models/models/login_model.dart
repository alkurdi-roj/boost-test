import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

@freezed
class LoginModel with _$LoginModel {
    const factory LoginModel({
        @Default(0) int id,
        @Default('') String username,
        @Default('') String email,
       @Default('') String firstName,
       @Default('') String lastName,
       @Default('') String gender,
       @Default('') String image,
       @Default('') String token,
       @Default('') String refreshToken,
    }) = _LoginModel;

    factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
}


@freezed
class FailureModel with _$FailureModel {
  const factory FailureModel({
    @Default('') String message,
    @Default(0) int code,
  }) = _FailureModel;

  factory FailureModel.fromJson(Map<String, dynamic> json) =>
      _$FailureModelFromJson(json);
}

ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

@freezed
class ProductsModel with _$ProductsModel {
    const factory ProductsModel({
        @Default([]) List<ProductsDataModel> products,
        @Default(0) int total,
        @Default(0) int skip,
        @Default(0) int limit,
    }) = _ProductsModel;

    factory ProductsModel.fromJson(Map<String, dynamic> json) => _$ProductsModelFromJson(json);
}

@freezed
class ProductsDataModel with _$ProductsDataModel {
    const factory ProductsDataModel({
        @Default(0) int id,
        @Default('') String title,
        @Default('') String description,
        @Default('') String category,
        @Default(0) double price,
        @Default(0) double discountPercentage,
        @Default(0) double rating,
        @Default(0) int stock,
        @Default([]) List<String> tags,
        @Default('') String brand,
        @Default('') String sku,
        @Default(0) int weight,
        @Default(Dimensions()) Dimensions dimensions,
        @Default('') String warrantyInformation,
        @Default('') String shippingInformation,
        @Default('') String availabilityStatus,
        @Default([]) List<Review> reviews,
        @Default('') String returnPolicy,
        @Default(0) int minimumOrderQuantity,
        @Default(Meta()) Meta meta,
        @Default([]) List<String> images,
        @Default('') String thumbnail,
    }) = _ProductsDataModel;

    factory ProductsDataModel.fromJson(Map<String, dynamic> json) => _$ProductsDataModelFromJson(json);
}

@freezed
class Dimensions with _$Dimensions {
    const factory Dimensions({
        @Default(0) double width,
        @Default(0) double height,
        @Default(0) double depth,
    }) = _Dimensions;

    factory Dimensions.fromJson(Map<String, dynamic> json) => _$DimensionsFromJson(json);
}

@freezed
class Meta with _$Meta {
    const factory Meta({
        @Default('') String createdAt,
        @Default('') String updatedAt,
        @Default('') String barcode,
        @Default('') String qrCode,
    }) = _Meta;

    factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
class Review with _$Review {
    const factory Review({
        @Default(0) int rating,
        @Default('') String comment,
        @Default('') String date,
        @Default('') String reviewerName,
        @Default('') String reviewerEmail,
    }) = _Review;

    factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

Map<String, String>defaultError = {
  'message': "error happened"
};

