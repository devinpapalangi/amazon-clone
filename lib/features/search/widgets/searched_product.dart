import 'package:amazon_clone/common/widgets/starts.dart';
import 'package:amazon_clone/utils/app_layout.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    for (int i = 0; i < product.rating!.length; i++) {
      totalRating += product.rating![i].rating;
    }
    double avgRating = 0;
    if (totalRating != 0) {
      avgRating = totalRating / product.rating!.length;
    }
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(10),
          ),
          child: Row(
            children: [
              Image.network(
                product.images[0],
                fit: BoxFit.contain,
                height: AppLayout.getHeight(135),
                width: AppLayout.getWidth(135),
              ),
              Column(
                children: [
                  Container(
                    width: AppLayout.getWidth(235),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.getWidth(10),
                    ),
                    child: Text(
                      product.name,
                      style: TextStyle(fontSize: 16),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: AppLayout.getWidth(235),
                    padding: EdgeInsets.only(
                      left: AppLayout.getWidth(10),
                      top: AppLayout.getHeight(5),
                    ),
                    child: Stars(rating: avgRating),
                  ),
                  Container(
                    width: AppLayout.getWidth(235),
                    padding: EdgeInsets.only(
                      left: AppLayout.getWidth(10),
                      top: AppLayout.getHeight(5),
                    ),
                    child: Text(
                      '\$${product.price}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: AppLayout.getWidth(235),
                    padding: EdgeInsets.only(
                      left: AppLayout.getWidth(10),
                    ),
                    child: const Text(
                      'Eligible for Free Shipping',
                    ),
                  ),
                  Container(
                    width: AppLayout.getWidth(235),
                    padding: EdgeInsets.only(
                      left: AppLayout.getWidth(10),
                      top: AppLayout.getHeight(5),
                    ),
                    child: const Text(
                      'In Stock.',
                      style: TextStyle(color: Colors.teal),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
