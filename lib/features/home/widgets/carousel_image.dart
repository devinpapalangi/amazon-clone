import 'package:amazon_clone/utils/app_constant.dart';
import 'package:amazon_clone/utils/app_layout.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: carouselImages.map((i) {
        return Builder(
            builder: (BuildContext) => Image.network(
                  i,
                  fit: BoxFit.cover,
                  height: AppLayout.getHeight(200),
                ));
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: AppLayout.getHeight(200),
      ),
    );
  }
}
