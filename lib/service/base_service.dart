import 'package:dio/dio.dart';

abstract class BaseService {
  Dio dio = Dio();
  String baseUrl = "https://dummyjson.com/products";
}

abstract class ProductService extends BaseService {
  Future getAllProduct();
  Future getcategory();
  Future getProductByCategorie(String categorieName);
  Future serchProduct(String product);
  Future deleteProduct(String id);

  Future login(String username, String password);
}
