import 'package:dio/dio.dart';
import 'package:laza/config/getit.dart';
import 'package:laza/model/login_model.dart';
import 'package:laza/service/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @override
  Future login(String username, String password) async {
    Response response = await dio.post('https://dummyjson.com/auth/login',
        data: LoginModel(username: username, password: password).toJson());
    // config.get<SharedPreferences>().setString('token', response.data['token']);
    // print(response.data);
    return response.data;
  }

  @override
  getProductByCategorie(String categorieName) async {
    Response response = await dio.get("$baseUrl/category/$categorieName");
    return response.data;
  }

  @override
  Future serchProduct(String product) async {
    Response response = await dio.get("$baseUrl/search?q=$product");
    return response.data;
  }

  @override
  Future deleteProduct(String id) async {
    Response response = await dio.delete('$baseUrl/$id');
    // print(response.data);
    return response.data;
  }
}
