import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/features/product_details/screens/product_detail_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/utils/app_layout.dart';
import 'package:flutter/material.dart';

class DeadlOfDay extends StatefulWidget {
  const DeadlOfDay({super.key});

  @override
  State<DeadlOfDay> createState() => _DeadlOfDayState();
}

class _DeadlOfDayState extends State<DeadlOfDay> {
  final HomeServices homeServices = HomeServices();
  Product? product;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  void navigateToDetailScreen() {
    Navigator.pushNamed(context, ProductDetailScreen.routeName,
        arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: navigateToDetailScreen,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(
                        left: AppLayout.getWidth(10),
                        top: AppLayout.getHeight(10),
                      ),
                      child: Text(
                        'Deal of the day',
                        style: TextStyle(
                            fontSize: AppLayout.getWidth(20),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Image.network(
                      product!.images[0],
                      height: 235,
                      fit: BoxFit.fitHeight,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: AppLayout.getWidth(15),
                      ),
                      alignment: Alignment.topLeft,
                      child: Text(
                        '\$100',
                        style: TextStyle(
                          fontSize: AppLayout.getWidth(18),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(
                        left: AppLayout.getWidth(15),
                        top: AppLayout.getHeight(5),
                        right: AppLayout.getWidth(40),
                      ),
                      child: Text(
                        'Rivaan',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: product!.images
                            .map(
                              (e) => Image.network(
                                e,
                                fit: BoxFit.fitWidth,
                                width: AppLayout.getWidth(100),
                                height: AppLayout.getHeight(100),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(
                        vertical: AppLayout.getHeight(15),
                      ).copyWith(
                        left: AppLayout.getWidth(15),
                      ),
                      child: Text(
                        'See all deals',
                        style: TextStyle(
                          color: Colors.cyan[800],
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}
