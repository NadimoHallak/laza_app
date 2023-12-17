import 'package:dio/dio.dart';
import 'package:laza/service/base_service.dart';

class ProductServiceImp extends ProductService {
  @override
  Future getAllProduct() async {
    Response response = await dio.get(baseUrl);
    return response.data;
  }

  @override
  Future getcategory() async {
    Response response = await dio.get('$baseUrl/categories');
    return response.data;
  }
}
