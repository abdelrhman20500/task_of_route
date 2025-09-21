import 'package:dartz/dartz.dart';
import 'package:task_of_route/Core/errors/failure.dart';
import 'package:task_of_route/Features/home/data/data_source/product_remote_data_source.dart';
import 'package:task_of_route/Features/home/data/model/products.dart';
import 'package:task_of_route/Features/home/domain/repo/product_repo.dart';

class ProductRepoImpl extends ProductRepo{
  final ProductBaseRemoteDataSource productBaseRemoteDataSource;

  ProductRepoImpl({required this.productBaseRemoteDataSource});
  @override
  Future<Either<Failure, List<Products>>> productData()async{
   try {
     var result = await productBaseRemoteDataSource.getProductData();
     return Right(result);
   } on Failure catch (failure) {
     return Left(failure);
   }
  }
  
}