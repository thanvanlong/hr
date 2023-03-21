import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../api/HrService.dart';
import '../../api/ServiceBuilder.dart';
import '../../model/User.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/backgroundImage.png"),
            fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          clipBehavior: Clip.hardEdge,
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(20),
              border: Border.all(color: Colors.white)
          ),
          child: FractionallySizedBox(
            heightFactor: 0.9,
            widthFactor: 0.95,
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TabBar(
                          tabs: [
                            Tab(
                              child: Text('Tài khoản',style: TextStyle(color: Colors.black),),
                            ),
                            Tab(
                              child: Text('Thông tin',style: TextStyle(color: Colors.black),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                body: Container(
                  color: Colors.white,
                  child: TabBarView(
                    children: [
                      FutureBuilder(
                        future: _getMe(),
                        builder: (context,data) {
                          if (data.hasData) {
                            return Container(
                              child: Column(
                                children: [
                                  Flexible(
                                    flex: 5,
                                    fit: FlexFit.tight,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: FractionallySizedBox(
                                        alignment: Alignment.bottomCenter,
                                        widthFactor: 0.4,
                                        heightFactor: 0.6,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              data.data!.avatar),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 6,
                                    child: Column(
                                      children: [
                                        Text(data.data!.fullName, style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text('Designer'),
                                        ),
                                        formInfo("Mã nhân viên:",
                                            "NGUYENVANBAMICGL"),
                                        formInfo("Lương cơ bản:",
                                            "NGUYENVANBAMICGL"),
                                        formInfo("Loại hình công việc:",
                                            "NGUYENVANBAMICGL"),
                                        formInfo(
                                            "Chức vụ:", "NGUYENVANBAMICGL"),
                                        formInfo(
                                            "Giảm trừ đối với đối tượng nộp thuế:",
                                            "NGUYENVANBAMICGL"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          } else {
                            return Container(
                                child: Center(child: Text('Có lỗi xẩy ra vui lòng thử lại')));
                          }
                        }
                      ),
                      Container(child: Center(child: Text('Đây là trang Thông tin'),),),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget formInfo(String title, String info) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    child: Row(
      children: [
        Expanded(
          child: Text(
              title
          ),
        ),
        Expanded(
          child: Text(
              info,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
}
