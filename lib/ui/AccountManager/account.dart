import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/api/HrService.dart';
import 'package:untitled/api/ServiceBuilder.dart';
import 'package:untitled/model/Salary.dart';
import 'package:untitled/ui/AccountManager/salary_box.dart';

import '../../model/User.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  // Salary _salary = new Salary('totalSalary', 'bonusProj', 'OTSalary', 'onsiteSalary', 'discountSalary', 'salaryAfterDeduction', 'salaryBeforeDeduction');
  String dropdownValue = 'One';
  Dio dio = new ServiceBuilder().getService();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  Future<User> _getMe () async {
    ResponseDTO responseDTO = await RestClient(dio).getMe();
    User user = User.fromJson(responseDTO.data);
    return user;
  }

  Future<List<Salary>> _getTotalSalaryMe() async {
    DateTime now = new DateTime.now();
    ResponseDTO responseDTO = await RestClient(dio).getTotalSalaryMe({"date_year":now.year.toString()});
    if (responseDTO.data is List) {
      List<Salary> list = (responseDTO.data as List).map((e) => Salary.fromJson(e)).toList();
      list.sort((a, b) => a.date.compareTo(b.date));
      return list;
    }


    return List.empty();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Color.fromRGBO(241, 242, 245, 1),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(8.0)),
                ),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  isExpanded: true,
                  icon: Icon(Icons.keyboard_arrow_down_outlined),
                  elevation: 1,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 18),
                          child: Text(value),
                        ),
                    );
                  }).toList()
                ),
              )
          ),
          // FutureBuilder(
          //   future: _getMe(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       print(snapshot.data!.email);
          //       return Text(snapshot.data!.avatar, style: TextStyle(color: Colors.red),);
          //     } else if (snapshot.hasError) {
          //       return Text('${snapshot.error}');
          //     }
          //
          //     // By default, show a loading spinner.
          //     return const CircularProgressIndicator();
          //   },
          // ),
          FutureBuilder(
            future: _getTotalSalaryMe(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Center(child: SalaryBox( salary: snapshot.data!.elementAt(index),)),
                        );
                      }
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          )
        ],
      )
    );
  }
}