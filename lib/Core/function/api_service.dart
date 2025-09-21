import 'package:dio/dio.dart';

class ApiService{
  final Dio dio;
  final baseUrl = "https://dummyjson.com/";

  ApiService(this.dio);
  /// get method..
  Future<Response> get({required String endpoint }) async {
    var response = await dio.get("$baseUrl$endpoint");
    return response;
  }
}

