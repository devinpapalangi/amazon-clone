import 'dart:convert';
import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/utils/app_error_handling.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../providers/user_provider.dart';
import '../../../utils/app_constant.dart';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User('', name, email, password, '', '', '', []);

      http.Response res = await http.post(
        Uri.parse('${uri}api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackbar(
                context, 'Account Created! Login with the same credentials');
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${uri}api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // ignore: avoid_print
      print(res.body);
      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            try {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              // ignore: use_build_context_synchronously
              Provider.of<UserProvider>(context, listen: false)
                  .setUser(res.body);
              await prefs.setString(
                  'x-auth-token', jsonDecode(res.body)['token']);
            } catch (e) {
              // ignore: avoid_print
              print(e);
            }
            Navigator.pushNamedAndRemoveUntil(
              context,
              BottomBar.routeName,
              (route) => false,
            );
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  void getUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http
          .post(Uri.parse('${uri}/tokenIsValid'), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': token!,
      });

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes =
            await http.get(Uri.parse('${uri}/'), headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        });

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
      // http.Response res = await http.post(
      //   Uri.parse('${uri}api/signin'),
      //   body: jsonEncode({
      //     'email': email,
      //     'password': password,
      //   }),
      //   headers: <String, String>{
      //     'Content-Type': 'application/json; charset=UTF-8',
      //   },
      // );
      // ignore: avoid_print
      // print(res.body);
      // ignore: use_build_context_synchronously
      // httpErrorHandle(
      //     response: res,
      //     context: context,
      //     onSuccess: () async {
      //       try {
      //         SharedPreferences prefs = await SharedPreferences.getInstance();
      //         // ignore: use_build_context_synchronously
      //         Provider.of<UserProvider>(context, listen: false)
      //             .setUser(res.body);
      //         await prefs.setString(
      //             'x-auth-token', jsonDecode(res.body)['token']);
      //       } catch (e) {
      //         // ignore: avoid_print
      //         print(e);
      //       }
      //       Navigator.pushNamedAndRemoveUntil(
      //         context,
      //         HomeScreen.routeName,
      //         (route) => false,
      //       );
      //     });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
