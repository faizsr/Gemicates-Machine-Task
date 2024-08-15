import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemicates_machine_task/src/feature/product/controller/product_controller.dart';
import 'package:gemicates_machine_task/src/feature/product/view/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductController>(context, listen: false)
          .fetchAllProducts(onRefresh: true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'GC',
                    style: TextStyle(
                        fontSize: 35, fontWeight: FontWeight.w800, height: 1),
                  ),
                  Row(
                    children: [
                      Icon(CupertinoIcons.burn),
                      SizedBox(width: 20),
                      Icon(CupertinoIcons.cart),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Our Products',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                  Text(
                    'Filter',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey,
                      height: 1,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Consumer<ProductController>(
                builder: (context, value, child) {
                  return Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Center(
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: List.generate(
                            value.products.length,
                            (index) => ProductCard(
                              product: value.products[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
