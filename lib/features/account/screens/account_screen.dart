import 'package:amazon_clone/features/account/widgets/below_app_bar.dart';
import 'package:amazon_clone/features/account/widgets/orders.dart';
import 'package:amazon_clone/features/account/widgets/top_buttons.dart';
import 'package:amazon_clone/utils/app_layout.dart';
import 'package:amazon_clone/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

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
              Container(
                padding: EdgeInsets.only(
                  left: AppLayout.getWidth(15),
                  right: AppLayout.getWidth(15),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: AppLayout.getWidth(15),
                      ),
                      child: Icon(Icons.notifications_none_outlined),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: AppLayout.getWidth(15),
                      ),
                      child: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const BelowAppBar(),
          Gap(AppLayout.getHeight(10)),
          TopButtons(),
          Gap(AppLayout.getHeight(10)),
          const Orders()
        ],
      ),
    );
  }
}
