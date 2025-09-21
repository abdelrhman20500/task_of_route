import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_of_route/Features/home/data/data_source/product_remote_data_source.dart';
import 'package:task_of_route/Features/home/data/repo/product_repo_impl.dart';

import '../function/api_service.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<ProductRepoImpl>(
    ProductRepoImpl(
      productBaseRemoteDataSource: ProductRemoteDateSource(
        apiService: getIt.get<ApiService>(),
      ),
    ),
  );
}
