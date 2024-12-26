import 'package:dartz/dartz.dart';
import '../../../../Core/errors/failure.dart';
import '../model/products.dart';


abstract class HomeRepo{
  Future<Either<Failure, List<Products>>>fetchHomeData();
}