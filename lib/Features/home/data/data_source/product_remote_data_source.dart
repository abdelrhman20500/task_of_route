import 'package:task_of_route/Core/errors/failure.dart';
import 'package:task_of_route/Core/function/api_service.dart';
import 'package:task_of_route/Features/home/data/model/products.dart';

abstract class ProductBaseRemoteDataSource{
  Future<List<Products>> getProductData();
}

class ProductRemoteDateSource extends ProductBaseRemoteDataSource{
  final ApiService apiService;

  ProductRemoteDateSource({required this.apiService});
  @override
  Future<List<Products>> getProductData()async{
    var response = await apiService.get(endpoint: "products");

    if (response.statusCode == 200) {
      final List<dynamic> dataList = response.data['products'];
      print(dataList);
      return dataList.map((e) => Products.fromJson(e)).toList();
    } else {
      throw ServerFailure.fromResponse(response.statusCode!, response.data);
    }
  }

}