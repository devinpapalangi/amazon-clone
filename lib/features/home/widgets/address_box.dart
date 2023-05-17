import 'package:amazon_clone/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: AppLayout.getHeight(40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 115, 226, 221),
            Color.fromARGB(255, 162, 236, 233),
          ],
          stops: [
            0.5,
            1.0,
          ],
        ),
      ),
      padding: EdgeInsets.only(left: AppLayout.getWidth(10)),
      child: Row(children: [
        Icon(
          Icons.location_on_outlined,
          size: AppLayout.getWidth(20),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: AppLayout.getWidth(5),
            ),
            child: Text(
              'Delivery to ${user.name} - ${user.address}',
              style: TextStyle(fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: AppLayout.getWidth(5),
            top: AppLayout.getWidth(2),
          ),
          child: const Icon(Icons.arrow_drop_down_outlined),
        ),
      ]),
    );
  }
}
