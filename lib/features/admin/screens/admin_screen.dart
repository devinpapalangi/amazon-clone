import 'package:amazon_clone/features/admin/screens/analytics_screen.dart';
import 'package:amazon_clone/features/admin/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_layout.dart';
import '../../../utils/app_style.dart';
import '../../account/screens/account_screen.dart';
import '../../home/screens/home_screen.dart';
import 'package:badges/badges.dart' as badges;
import '../../admin/screens/product_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const ProductScreen(),
    const AnalyticsScreen(),
    const OrdersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: Styles.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/amazon_in.png',
                  width: AppLayout.getWidth(120),
                  height: AppLayout.getHeight(45),
                  color: Colors.black,
                ),
              ),
              const Text(
                'Admin',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
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
                child: Icon(Icons.home_outlined),
              ),
              label: '',
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
                child: const Icon(Icons.analytics_outlined),
              ),
              label: '',
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
                child: Icon(Icons.all_inbox_outlined),
              ),
              label: '',
            ),
          ]),
    );
  }
}
