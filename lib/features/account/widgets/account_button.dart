import 'package:flutter/material.dart';

import '../../../utils/app_layout.dart';

class AccountButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const AccountButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(10),
        ),
        height: AppLayout.getHeight(40),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.circular(
              AppLayout.getWidth(50),
            ),
            color: Colors.white),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black12.withOpacity(0.03),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppLayout.getWidth(50),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
