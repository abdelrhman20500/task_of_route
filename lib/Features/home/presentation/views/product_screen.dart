import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_of_route/Core/uitis/dialog.dart';
import 'package:task_of_route/Core/uitis/set_up_service_locator.dart';
import 'package:task_of_route/Features/home/data/repo/product_repo_impl.dart';
import 'package:task_of_route/Features/home/domain/use_case/product_use_case.dart';
import 'package:task_of_route/Features/home/presentation/view_model/cubit/product_cubit.dart';
import 'package:task_of_route/Features/home/presentation/view_model/cubit/product_state.dart';
import 'package:task_of_route/Features/home/presentation/views/widget/product_grid_view.dart';
import 'package:task_of_route/Features/home/presentation/views/widget/search_item.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  static const String routeName ="ProductScreen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Route",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: SearchItem(),
            ),
            BlocProvider<ProductCubit>(
              create: (BuildContext context) => ProductCubit(ProductUseCase(
                getIt.get<ProductRepoImpl>(),),)..productData(),
              child: BlocBuilder<ProductCubit, ProductState>(
                builder: (BuildContext context, ProductState state) {
                  if (state is ProductLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductFailure) {
                    showErrorDialog(context, state.errMessage);
                  } else if (state is ProductSuccess) {
                    return ProductGridView(model: state.products);
                  }
                  return Container();
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}