import 'package:dio/dio.dart';

class ApiManager{
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://dummyjson.com/',
        receiveDataWhenStatusError: false,
      ),
    );
  }
   Future<Response> getData({required String endPoint}) async {
    return await dio.get(endPoint);
  }
}