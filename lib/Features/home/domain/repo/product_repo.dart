import 'package:dartz/dartz.dart';
import 'package:task_of_route/Core/errors/failure.dart';
import 'package:task_of_route/Features/home/data/model/products.dart';

abstract class ProductRepo{
  Future<Either< Failure, List<Products>>> productData();
}