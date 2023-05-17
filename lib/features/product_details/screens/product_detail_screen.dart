import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/starts.dart';
import 'package:amazon_clone/features/product_details/services/product_details_services.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../../utils/app_constant.dart';
import '../../../utils/app_layout.dart';
import '../../../utils/app_style.dart';
import '../../search/screens/search_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = "/product-details";
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<ProductDetailScreen> {
  final ProductDetailServices productDetailServices = ProductDetailServices();
  double avgRating = 0;
  double myRating = 0;

  @override
  void initState() {
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }
    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  void addToCart() {
    productDetailServices.addToCart(context: context, product: widget.product);
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: Styles.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: AppLayout.getHeight(42),
                  margin: EdgeInsets.only(left: AppLayout.getWidth(15)),
                  child: Material(
                    borderRadius: BorderRadius.circular(AppLayout.getWidth(7)),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: AppLayout.getWidth(6),
                              ),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: AppLayout.getWidth(23),
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(
                            top: AppLayout.getHeight(10),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppLayout.getWidth(7)),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppLayout.getWidth(7)),
                            ),
                            borderSide: BorderSide(
                                color: Colors.black38,
                                width: AppLayout.getWidth(1)),
                          ),
                          hintText: 'Search Amazon.in',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: AppLayout.getWidth(17))),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: AppLayout.getHeight(42),
                margin: EdgeInsets.symmetric(
                  horizontal: AppLayout.getWidth(10),
                ),
                child: Icon(
                  Icons.mic,
                  color: Colors.black,
                  size: AppLayout.getWidth(25),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.product.id!),
                  Stars(
                    rating: avgRating,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getWidth(10),
                  vertical: AppLayout.getHeight(20)),
              child: Text(
                widget.product.name,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            CarouselSlider(
              items: widget.product.images.map((i) {
                return Builder(
                    builder: (BuildContext) => Image.network(
                          i,
                          fit: BoxFit.contain,
                          height: AppLayout.getHeight(200),
                        ));
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: AppLayout.getHeight(300),
              ),
            ),
            Container(
              color: Colors.black12,
              height: AppLayout.getHeight(5),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  text: 'Deal Price: ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: '\$${widget.product.price}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.product.description),
            ),
            Container(
              color: Colors.black12,
              height: AppLayout.getHeight(5),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: CustomButton(text: 'Buy Now', onPressed: () {}),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: CustomButton(
                text: 'Add to Cart',
                onPressed: addToCart,
                color: Color.fromRGBO(254, 216, 19, 1),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppLayout.getHeight(10),
                vertical: AppLayout.getHeight(10),
              ),
              child: const Text(
                'Rate this item',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            RatingBar.builder(
              initialRating: myRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemPadding:
                  EdgeInsets.symmetric(horizontal: AppLayout.getWidth(4.0)),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Styles.secondaryColor,
              ),
              onRatingUpdate: (rating) {
                productDetailServices.rateProduct(
                    context: context, product: widget.product, rating: rating);
              },
            ),
          ],
        ),
      ),
    );
  }
}
