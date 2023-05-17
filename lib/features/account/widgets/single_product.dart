import 'package:flutter/material.dart';
import 'package:amazon_clone/utils/app_layout.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  const SingleProduct({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppLayout.getWidth(5),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border:
              Border.all(color: Colors.black12, width: AppLayout.getWidth(1.5)),
          borderRadius: BorderRadius.circular(
            AppLayout.getWidth(5),
          ),
          color: Colors.white,
        ),
        child: Container(
          width: AppLayout.getWidth(180),
          padding: EdgeInsets.symmetric(
            horizontal: AppLayout.getHeight(10),
            vertical: AppLayout.getHeight(10),
          ),
          child: Image.network(
            image,
            fit: BoxFit.fitHeight,
            width: AppLayout.getWidth(180),
          ),
        ),
      ),
    );
  }
}
