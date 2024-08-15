import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    // required this.product,
  });

  // final ProductEntity product;

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
                // color: const Color.fromARGB(255, 241, 245, 255),
                // image: DecorationImage(
                //   image: NetworkImage(),
                //   fit: BoxFit.cover,
                // ),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 160,
            ),
            const SizedBox(height: 15),
            Text(
              'title',
              style: TextStyle(
                fontSize: 14.5,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              'product.description',
              maxLines: 3,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                discountWidget(),
                Text(
                  "\$599",
                  style: const TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "10% off",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.amberAccent,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget discountWidget() {
    // return Consumer<ProductController>(
    // builder: (context, value, child) {
    return
        // value.discountStatus
        // ?
        Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Text(
        "\$799",
        style: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.lineThrough,
        ),
      ),
      // ); // : const SizedBox();
      // },
    );
  }
}
