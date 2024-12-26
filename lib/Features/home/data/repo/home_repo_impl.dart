import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../Core/errors/failure.dart';
import '../../../../Core/uitis/endpoints.dart';
import '../api_manager/api_manager.dart';
import '../model/products.dart';
import 'home_repo.dart';


class HomeRepoImpl implements HomeRepo {
  final ApiManager apiManager;

  HomeRepoImpl(this.apiManager);

  @override
  Future<Either<Failure, List<Products>>> fetchHomeData() async {
    try {
      // Await the asynchronous call to getData
      final response = await apiManager.getData(endPoint: getProducts);

      // Check if the response is successful
      if (response.statusCode == 200 && response.statusCode! <300) {
        // Extract the data from the response
        final Map<String, dynamic> data = response.data; // Assuming the response data is a Map

        // Access the 'products' key to get the list of products
        final List<dynamic> productsData = data['products'];

        // Map the data to a list of Products
        List<Products> products = productsData.map((item) => Products.fromJson(item)).toList();

        return right(products);
      } else {
        // Handle non-200 responses
        return left(ServerFailure('Failed to load data: ${response.statusCode}'));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}