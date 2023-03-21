import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../api/HrService.dart';
import '../../api/ServiceBuilder.dart';
import '../../model/User.dart';
class AppBarCustom extends StatefulWidget implements PreferredSizeWidget{
  const AppBarCustom({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
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
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        FutureBuilder(
          future: _getMe(),
          builder: (context,data) {
            if (data.hasData) {
              return CircleAvatar(
                backgroundImage: NetworkImage(data.data!.avatar),
              );
            } else {
              return CircleAvatar(
                backgroundImage: NetworkImage("https://i.pinimg.com/736x/43/a3/b9/43a3b96f80f24e657cb93aa0e5e7ac10.jpg"),
              );
            }
          }
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.expand_more,color: Colors.black,))
      ],
    );
  }
}

