import 'package:flutter/material.dart';
import 'package:gemicates_machine_task/src/feature/product/controller/product_controller.dart';
import 'package:gemicates_machine_task/src/feature/product/model/product_model.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width / 2 - 20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 20,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.thumbnail),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 160,
            ),
            const SizedBox(height: 15),
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 14.5,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),
            Text(
              product.brand,
              maxLines: 3,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                discountWidget(),
                Text(
                  "\$${product.discountedPrice.round()}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "${product.discountPrecentage.round()}%",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Consumer<ProductController> discountWidget() {
    return Consumer<ProductController>(
      builder: (context, value, child) {
        return value.discountStatus
            ? Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  "\$${product.price.round()}",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              )
            : const SizedBox();
      },
    );
  }
}
