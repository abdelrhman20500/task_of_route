import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../data/model/products.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({super.key, required this.products});
  final Products products;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: products.images![0],
                    fit: BoxFit.fill,
                    height: height * 0.17, // Adjust height
                    width: double.infinity, // Full width
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[700]!,
                      highlightColor: Colors.grey[500]!,
                      child: Container(
                        height: height * 0.2,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                  ),
                ),
                Positioned(
                  top: 4.0,
                  right: 4.0,
                  child: CircleAvatar(
                    backgroundColor:
                    Colors.white, // 🔵 Your custom color
                    radius: 24, // You can adjust size as needed
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.blue,
                        size: 28,
                      ), // Contrast color
                    ),
                  ),
                ),
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

  // Widget _buildShimmerEffect(BuildContext context) {
  //   return Shimmer.fromColors(
  //     baseColor: Colors.white,
  //     highlightColor: Colors.grey.shade300,
  //     direction: ShimmerDirection.ltr,
  //     child: Container(
  //       height: MediaQuery.of(context).size.height * 0.2,
  //       width: double.infinity,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(12.0),
  //         color: Colors.white,
  //       ),
  //     ),
  //   );
  // }
}