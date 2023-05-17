import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_layout.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: BoxDecoration(
        gradient: Styles.appBarGradient,
      ),
      padding: EdgeInsets.only(
        left: AppLayout.getWidth(10),
        right: AppLayout.getWidth(10),
        bottom: AppLayout.getWidth(10),
      ),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
                text: 'Hello, ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: AppLayout.getWidth(22),
                ),
                children: [
                  TextSpan(
                    text: user.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: AppLayout.getWidth(22),
                        fontWeight: FontWeight.w600),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
