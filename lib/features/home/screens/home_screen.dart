import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/home/widgets/carousel_image.dart';
import 'package:amazon_clone/features/home/widgets/deal_of_day.dart';
import 'package:amazon_clone/features/home/widgets/top_categories.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';
import '../../../utils/app_layout.dart';
import '../../../utils/app_style.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          children: [
            const AddressBox(),
            Gap(AppLayout.getHeight(10)),
            TopCategories(),
            CarouselImage(),
            DeadlOfDay(),
          ],
        ),
      ),
    );
  }
}
