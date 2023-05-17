import 'package:amazon_clone/utils/app_constant.dart';
import 'package:amazon_clone/utils/app_layout.dart';
import 'package:flutter/material.dart';

import '../screens/category_deals_screen.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

  void navigateToCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryDealsScreen.routeName,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppLayout.getHeight(60),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemExtent: AppLayout.getWidth(80),
          itemCount: categoryImages.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => navigateToCategoryPage(
                context,
                categoryImages[index]['title']!,
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.getWidth(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppLayout.getWidth(50),
                      ),
                      child: Image.asset(
                        categoryImages[index]['image']!,
                        fit: BoxFit.fill,
                        height: AppLayout.getHeight(40),
                        width: AppLayout.getWidth(40),
                      ),
                    ),
                  ),
                  Text(
                    categoryImages[index]['title']!,
                    style: TextStyle(
                      fontSize: AppLayout.getWidth(12),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
