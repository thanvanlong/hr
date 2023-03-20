import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:untitled/ui/AccountManager/account.dart';
import 'package:untitled/ui/MonthlySalary/monthlySalary.dart';
class NavigationDrawer extends StatefulWidget {
   NavigationDrawer({Key? key,
                    required this.contextHome}) : super(key: key);

   BuildContext contextHome;

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  Widget buildHeader(BuildContext context) => Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image(image: AssetImage('assets/logoFullTina.png')),
      )
  );

  Widget buildMenuItems(BuildContext context) => Padding(
    padding: const EdgeInsets.all(12.0),
    child: Wrap(
      spacing: 12,
      children: [
        Column(
          children: [
            ListTile(
              leading: Icon(Icons.people,color: Colors.white,),
              title: Text('Quản lý tài khoản',style: TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.of(widget.contextHome).pushReplacement(MaterialPageRoute(builder: (context) => const Account()));
              },
            ),
            ListTile(
              leading: Icon(Icons.payment_rounded,color: Colors.white),
              title: Text('Quản lý bảng lương',style: TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.of(widget.contextHome).pushReplacement(MaterialPageRoute(builder: (context) => const MonthlySalary()));
              },
            ),
            ListTile(
              leading: Icon(Icons.payment_rounded,color: Colors.white),
              title: Text('Bảng lương cá nhân',style: TextStyle(color: Colors.white),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.people,color: Colors.white),
              title: Text('Duyệt lương nhân viên',style: TextStyle(color: Colors.white),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.request_page,color: Colors.white),
              title: Text('Đơn xin nghỉ phép',style: TextStyle(color: Colors.white),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.request_page,color: Colors.white),
              title: Text('Quản lý đơn nghỉ phép',style: TextStyle(color: Colors.white),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.event,color: Colors.white),
              title: Text('Sự kiện công ty',style: TextStyle(color: Colors.white),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.event,color: Colors.white),
              title: Text('Sinh nhật',style: TextStyle(color: Colors.white),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person,color: Colors.white),
              title: Text('Thông tin tài khoản',style: TextStyle(color: Colors.white),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.folder,color: Colors.white),
              title: Text('Nội quy - Quy định',style: TextStyle(color: Colors.white),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.calendar_month,color: Colors.white),
              title: Text('Lịch làm việc',style: TextStyle(color: Colors.white),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.file_open,color: Colors.white),
              title: Text('Dự án',style: TextStyle(color: Colors.white),),
              onTap: () {},
            ),
            ExpansionTile(
              collapsedBackgroundColor: Color.fromRGBO(0, 21, 41, 1),
              backgroundColor: Color.fromRGBO(3, 15, 27, 1),
              collapsedIconColor: Colors.white,
              iconColor: Colors.white,
              leading: Icon(Icons.display_settings_outlined,color: Colors.white),
              title: Text('Cài đặt',style: TextStyle(color: Colors.white),),
              children: [
                ListTile(
                  leading: Spacer(),
                  title: Text('Chức vụ',style: TextStyle(color: Colors.white),),
                  onTap: () {},
                ),
                ListTile(
                  leading: Spacer(),
                  title: Text('Loại hình làm việc',style: TextStyle(color: Colors.white),),
                  onTap: () {},
                ), ListTile(
                  leading: Spacer(),
                  title: Text('Phân quyền',style: TextStyle(color: Colors.white),),
                  onTap: () {},
                ),

              ],
            ),
            ListTile(
              leading: Icon(Icons.arrow_back,color: Colors.white),
              title: Text('Đăng xuất',style: TextStyle(color: Colors.white),),
              onTap: () {},
            ),
          ],
        ),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(0, 21, 41, 1),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context)
          ],
        ),
      ),
    );

  }
}