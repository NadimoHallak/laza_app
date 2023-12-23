import 'package:dio/dio.dart';
import 'package:laza/model/product_model.dart';
import 'package:laza/model/request_product.dart';

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
  Future updateProduct(String id, Product product);
  Future createProduct(RequestProduct product);
  Future login(String username, String password);
}
