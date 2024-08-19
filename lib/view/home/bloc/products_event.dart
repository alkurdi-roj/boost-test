part of 'products_bloc.dart';

abstract class ProductsEvent {}

class GetProductsEvent extends ProductsEvent {

  int? page, limit;
  GetProductsEvent({this.page, this.limit});
}
