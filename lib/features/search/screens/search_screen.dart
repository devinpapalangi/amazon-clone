import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/product_details/screens/product_detail_screen.dart';
import 'package:amazon_clone/features/search/services/search_services.dart';
import 'package:amazon_clone/features/search/widgets/searched_product.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/app_layout.dart';
import '../../../utils/app_style.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({super.key, required this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  void initState() {
    super.initState();
    fetchSearchProducts();
  }

  fetchSearchProducts() async {
    products = await searchServices.fetchSearchProducts(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
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
                      borderRadius:
                          BorderRadius.circular(AppLayout.getWidth(7)),
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
        body: products == null
            ? const Loader()
            : Column(
                children: [
                  const AddressBox(),
                  Gap(AppLayout.getHeight(10)),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ProductDetailScreen.routeName,
                                arguments: products![index]);
                          },
                          child: SearchedProduct(
                            product: products![index],
                          ),
                        );
                      },
                      itemCount: products!.length,
                    ),
                  ),
                ],
              ));
  }
}
