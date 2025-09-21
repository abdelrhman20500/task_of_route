import 'package:dartz/dartz.dart';
import 'package:task_of_route/Core/base_use_case/base_use_case.dart';
import 'package:task_of_route/Core/errors/failure.dart';
import 'package:task_of_route/Features/home/data/model/products.dart';
import 'package:task_of_route/Features/home/domain/repo/product_repo.dart';

class ProductUseCase extends BaseUseCase<List<Products>, NoParameters>{

  final ProductRepo productRepo;

  ProductUseCase(this.productRepo);
  @override
  Future<Either<Failure, List<Products>>> call(NoParameters parameters) async{
    return await productRepo.productData();
  }

}