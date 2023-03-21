import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:untitled/ui/AccountManager/account.dart';
import 'package:untitled/ui/Home/home.dart';
import 'package:untitled/ui/MonthlySalary/monthlySalary.dart';
class NavigationDrawer extends StatefulWidget {
  NavigationDrawer({Key? key}) : super(key: key);



  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image(image: AssetImage('assets/logoFullTina.png')),
        )
    );

  }
}