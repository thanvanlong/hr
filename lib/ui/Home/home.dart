import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ui/AccountManager/account.dart';
import 'package:untitled/ui/AppBar/appBar.dart';
import 'package:untitled/ui/Infomation/info.dart';
import 'package:untitled/ui/MonthlySalary/monthlySalary.dart';
import 'package:untitled/ui/NavigationDrawer/navigationDrawer.dart';
import 'package:untitled/ui/Screen/EventScreen/event_screen.dart';

import '../Screen/LetterLeaveScreen/letter_leave_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.eventCompany;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.account) {
      container = Account();
    } else if (currentPage == DrawerSections.monthSalary) {
      container = MonthlySalary();
    } else if (currentPage == DrawerSections.accountInfo) {
      container = Info();
    } else if (currentPage == DrawerSections.resignationform) {
      container = LetterLeaveScreen();
    } else if (currentPage == DrawerSections.eventCompany) {
      container = EventScreen();
    }
    return Scaffold(
      appBar: AppBarCustom(),
      body: container,
      drawer: Drawer(
        backgroundColor: Color.fromRGBO(0, 21, 41, 1),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                NavigationDrawer(),
                buildMenuItems(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) => Padding(
    padding: const EdgeInsets.all(12.0),
    child: Wrap(
      spacing: 16,
      children: [
        Column(
          children: [
            menuItem(1, 'Quản lý tài khoản', Icons.people,
                currentPage == DrawerSections.account),
            menuItem(2, 'Quản lý bảng lương', Icons.payment_rounded,
                currentPage == DrawerSections.monthSalary),
            menuItem(3, 'Bảng lương cá nhân', Icons.payment_rounded,
                currentPage == DrawerSections.mySalary),
            menuItem(4, 'Duyệt lương nhân viên', Icons.people,
                currentPage == DrawerSections.reviewSalary),
            menuItem(5, 'Đơn xin nghỉ phép', Icons.request_page,
                currentPage == DrawerSections.resignationform),
            menuItem(6, 'Quản lý đơn nghỉ phép', Icons.request_page,
                currentPage == DrawerSections.resignationManager),
            menuItem(7, 'Sự kiện công ty', Icons.event,
                currentPage == DrawerSections.eventCompany),
            menuItem(8, 'Sinh nhật', Icons.event,
                currentPage == DrawerSections.birthday),
            menuItem(9, 'Thông tin tài khoản', Icons.person,
                currentPage == DrawerSections.accountInfo),
            menuItem(10, 'Nội quy - Quy định', Icons.folder,
                currentPage == DrawerSections.regulaAndRule),
            menuItem(11, 'Lịch làm việc', Icons.calendar_month,
                currentPage == DrawerSections.schedule),
            menuItem(12, 'Dự án', Icons.file_open,
                currentPage == DrawerSections.project),
            ExpansionTile(
              collapsedBackgroundColor: Color.fromRGBO(0, 21, 41, 1),
              backgroundColor: Color.fromRGBO(3, 15, 27, 1),
              collapsedIconColor: Colors.white,
              iconColor: Colors.white,
              leading: Icon(Icons.display_settings_outlined,color: Colors.white),
              title: Text('Cài đặt',style: TextStyle(color: Colors.white),),
              children: [
                menuItem(13, 'Chức vụ', Icons.search,
                    currentPage == DrawerSections.Position),
                menuItem(14, 'Loại hình làm việc', Icons.search,
                    currentPage == DrawerSections.emplymentType),
                menuItem(15, 'Phân quyền', Icons.search,
                    currentPage == DrawerSections.delagation),
              ],
            ),
            menuItem(16, 'Đăng xuất', Icons.arrow_back,
                currentPage == DrawerSections.logOut),
          ],
        ),
      ],
    ),
  );

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          if (id == 1) {
            currentPage = DrawerSections.account;
          } else if (id == 2) {
            currentPage = DrawerSections.monthSalary;
          } else if (id == 3) {
            currentPage = DrawerSections.mySalary;
          } else if (id == 4) {
            currentPage = DrawerSections.reviewSalary;
          } else if (id == 5) {
            currentPage = DrawerSections.resignationform;
          } else if (id == 6) {
            currentPage = DrawerSections.resignationManager;
          } else if (id == 7) {
            currentPage = DrawerSections.eventCompany;
          } else if (id == 8) {
            currentPage = DrawerSections.birthday;
          } else if (id == 9) {
            currentPage = DrawerSections.accountInfo;
          } else if (id == 10) {
            currentPage = DrawerSections.regulaAndRule;
          } else if (id == 11) {
            currentPage = DrawerSections.schedule;
          } else if (id == 12) {
            currentPage = DrawerSections.project;
          } else if (id == 13) {
            currentPage = DrawerSections.Position;
          } else if (id == 14) {
            currentPage = DrawerSections.emplymentType;
          } else if (id == 15) {
            currentPage = DrawerSections.delagation;
          } else if (id == 16) {
            currentPage = DrawerSections.logOut;
          }
        });
      },
      tileColor: selected ? Color.fromRGBO(0, 131, 255, 1) : null,
      title: Text(title,style: TextStyle(color: Colors.white),),
      leading: Icon(icon == Icons.search ? null : icon,color: Colors.white,),
    );
  }
}


enum DrawerSections {
  account,
  monthSalary,
  mySalary,
  reviewSalary,
  resignationform,
  resignationManager,
  eventCompany,
  birthday,
  accountInfo,
  regulaAndRule,
  schedule,
  project,
  setting,
  Position,
  emplymentType,
  delagation,
  logOut,

}




