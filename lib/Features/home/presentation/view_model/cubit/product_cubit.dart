import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_of_route/Core/base_use_case/base_use_case.dart';
import 'package:task_of_route/Features/home/domain/use_case/product_use_case.dart';
import 'package:task_of_route/Features/home/presentation/view_model/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState>{
  ProductCubit(this.productUseCase) : super(ProductInitial());
  
  final ProductUseCase productUseCase;
  Future<void> productData()async{
    var result = await productUseCase.call(const NoParameters());
    result.fold((e){
      emit(ProductFailure(errMessage: e.errMessage));
    }, (products){
      emit(ProductSuccess(products: products));
    });
  }
}