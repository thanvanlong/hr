import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/api/HrService.dart';
import 'package:untitled/api/ServiceBuilder.dart';
import 'package:untitled/ui/AccountManager/account.dart';
import 'package:untitled/ui/NavigationDrawer/navigationDrawer.dart';

import '../../model/User.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Dio _dio = new ServiceBuilder().getService();

  Future<User?> _getMe () async {
    ResponseDTO responseDTO = await RestClient(_dio).getMe();
    User? user;
    if (responseDTO.success) {
      user = User.fromJson(responseDTO.data);
      return user;
    } else {
      return user;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          FutureBuilder(
            future: _getMe(),
            builder: (context, data) {
            if (data.hasData) {
              print(data.data!.avatar);
              return CircleAvatar(
                backgroundImage: NetworkImage('https://bedental.vn/wp-content/uploads/2022/11/anh-gai-dep-toc-ngan-bikini-4.jpg'),
              );
            } else {
              return CircleAvatar(
                backgroundImage: NetworkImage('https://i.pinimg.com/736x/43/a3/b9/43a3b96f80f24e657cb93aa0e5e7ac10.jpg'),
              );
            }
          }),
          IconButton(onPressed: () {}, icon: Icon(Icons.expand_more,color: Colors.black,))
        ],
      ),
      body: Account(),
      drawer: NavigationDrawer(contextHome: context,),
    );
  }
}




