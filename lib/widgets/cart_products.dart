import 'package:flutter/material.dart';
import 'package:store_app/Screens/update_product_page.dart';
import 'package:store_app/models/prodect_model.dart';

class CartProducts extends StatelessWidget {
  CartProducts({
    super.key,
    required this.product,
  });
  ProdectModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 40,
                      color: Colors.grey.withOpacity(.2),
                      spreadRadius: 0,
                      offset: const Offset(20, 5)),
                ],
              ),
              child: Card(
                elevation: 10,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            " \$${product.price}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 80,
              left: 35,
              child: Image.network(
                product.image,
                height: 100,
                width: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
