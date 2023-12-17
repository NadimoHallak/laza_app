import 'package:dio/dio.dart';

abstract class BaseService {
  Dio dio = Dio();
  String baseUrl = "https://dummyjson.com/products";
}

abstract class ProductService extends BaseService {
  Future getAllProduct();
  Future getcategory();
}
