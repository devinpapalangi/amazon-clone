import 'package:amazon_clone/features/account/services/account_services.dart';
import 'package:amazon_clone/features/account/widgets/account_button.dart';
import 'package:amazon_clone/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TopButtons extends StatelessWidget {
  final AccountServices accountServices = AccountServices();

  TopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: 'Your orders', onPressed: () {}),
            AccountButton(text: 'Turn Seller', onPressed: () {})
          ],
        ),
        Gap(AppLayout.getHeight(10)),
        Row(
          children: [
            AccountButton(
                text: 'Log Out',
                onPressed: () => accountServices.logOut(context)),
            AccountButton(text: 'Your Wish List', onPressed: () {})
          ],
        ),
      ],
    );
  }
}
