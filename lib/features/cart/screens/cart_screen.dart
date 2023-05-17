import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/features/address/screens/address_screen.dart';
import 'package:amazon_clone/features/cart/widgets/cart_product.dart';
import 'package:amazon_clone/features/cart/widgets/cart_subtotal.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_layout.dart';
import '../../../utils/app_style.dart';
import '../../search/screens/search_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void navigateToAddressScreen(int sum) {
    Navigator.pushNamed(context, AdressScreen.routeName,
        arguments: sum.toString());
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
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
            const CartSubtotal(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                text: 'Proceed to buy(${user.cart.length} items)',
                onPressed: () => navigateToAddressScreen(sum),
                color: Colors.yellow.shade600,
              ),
            ),
            Gap(
              AppLayout.getHeight(15),
            ),
            Container(
              color: Colors.black12.withOpacity(0.08),
              height: AppLayout.getWidth(1),
            ),
            Gap(
              AppLayout.getHeight(5),
            ),
            ListView.builder(
              itemCount: user.cart.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CartProduct(index: index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
