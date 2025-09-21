import 'package:flutter/material.dart';
import 'package:task_of_route/Features/home/presentation/views/widget/item_product.dart';

import '../../../data/model/products.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key, required this.model,});

  final List<Products> model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: model.length,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Set the number of columns
            mainAxisSpacing: 8.0, // Set the spacing between rows
            crossAxisSpacing: 8.0, // Set the spacing between columns
            childAspectRatio: 1.4 / 2.2,
          ),
          itemBuilder: (context, index) {
            return ItemProduct(
              products: model[index],
            );
          },
        ),
      ),
    );
  }
}

