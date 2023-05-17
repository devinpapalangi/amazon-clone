import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/cart/screens/cart_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/utils/app_layout.dart';
import 'package:amazon_clone/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class BottomBar extends StatefulWidget {
  static const routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          selectedItemColor: Styles.selectedNavBarColor,
          unselectedItemColor: Styles.unselectedNavBarColor,
          backgroundColor: Styles.backgroundColor,
          iconSize: AppLayout.getWidth(28),
          onTap: updatePage,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                width: AppLayout.getWidth(42),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 0
                            ? Styles.selectedNavBarColor
                            : Styles.backgroundColor,
                        width: AppLayout.getWidth(5)),
                  ),
                ),
                child: const badges.Badge(
                  badgeStyle: badges.BadgeStyle(
                    elevation: 0,
                    badgeColor: Colors.white,
                  ),
                  badgeContent: Text(
                    '2',
                  ),
                  child: Icon(Icons.home_outlined),
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: AppLayout.getWidth(42),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 1
                            ? Styles.selectedNavBarColor
                            : Styles.backgroundColor,
                        width: AppLayout.getWidth(5)),
                  ),
                ),
                child: const badges.Badge(
                  badgeStyle: badges.BadgeStyle(
                    elevation: 0,
                    badgeColor: Colors.white,
                  ),
                  badgeContent: Text(
                    '1',
                  ),
                  child: Icon(Icons.person_outlined),
                ),
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: AppLayout.getWidth(42),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 2
                            ? Styles.selectedNavBarColor
                            : Styles.backgroundColor,
                        width: AppLayout.getWidth(5)),
                  ),
                ),
                child: badges.Badge(
                  badgeStyle: badges.BadgeStyle(
                    elevation: 0,
                    badgeColor: Colors.white,
                  ),
                  badgeContent: Text(userCartLen.toString()),
                  child: Icon(Icons.shopping_cart_outlined),
                ),
              ),
              label: 'Cart',
            ),
          ]),
    );
  }
}
