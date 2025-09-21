

import '../../../data/model/products.dart';

abstract class ProductState{}
class ProductInitial extends ProductState{}
class ProductLoading extends ProductState{}
class ProductFailure extends ProductState{
  final String errMessage;
  ProductFailure({required this.errMessage});
}
class ProductSuccess extends ProductState{
  final List<Products> products;
  ProductSuccess({required this.products});
}