import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../data/model/products.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({super.key, required this.products});
  final Products products;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.36,
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: Colors.blue),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    products.images![0],
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child; // Show the image when it's fully loaded
                      }
                      // Show shimmer effect while loading
                      return _buildShimmerEffect(context);
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.grey[300], // Placeholder color for error
                        ),
                        child: const Icon(Icons.error), // Error icon
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 3), // Adjust the offset to change the shadow position
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(Icons.favorite_border_sharp, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 4),
            Text(
              products.description!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 2),
            Expanded(
              child: Row(
                children: [
                  Text("EGP ${products.price}", style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 12),
                  Text(
                    "${products.discountPercentage} EGP",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.blue,
                      decorationThickness: 3,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Expanded(
              child: Row(
                children: [
                  const Text("Review", style: TextStyle(fontSize: 16)),
                  Text("(${products.rating!})", style: const TextStyle(fontSize: 16)),
                  const Icon(Icons.star, size: 22, color: Colors.yellow),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.add, size: 18, color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerEffect(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey.shade300,
      direction: ShimmerDirection.ltr,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
      ),
    );
  }
}