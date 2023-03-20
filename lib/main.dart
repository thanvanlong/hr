import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/store/SharePrefs.dart';
import 'package:untitled/ui/AccountManager/account.dart';
import 'package:untitled/ui/Home/home.dart';
import 'package:untitled/ui/loginScreen/login_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final SharePrefs _sharePrefs = Get.put(SharePrefs());
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: _sharePrefs.accessToken == '' ? 'login' :'account',
      routes: <String, WidgetBuilder> {
        'login': (context) => LoginScreen(),
        'account': (context) => HomePage()
      }
    );
  }
}



