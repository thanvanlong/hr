import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/api/HrService.dart';
import 'package:untitled/api/ServiceBuilder.dart';
import 'package:untitled/model/Salary.dart';
import 'package:untitled/ui/AccountManager/salary_box.dart';
import 'package:untitled/ui/Components/drop_down.dart';

import '../../model/User.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  List<String> list = <String>['2022', '2023'];
  // Salary _salary = new Salary('totalSalary', 'bonusProj', 'OTSalary', 'onsiteSalary', 'discountSalary', 'salaryAfterDeduction', 'salaryBeforeDeduction');
  String dropdownValue = '2023';
  Dio dio = new ServiceBuilder().getService();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<List<Salary>> _getTotalSalaryMe() async {
    ResponseDTO<List<Salary>> responseDTO = await RestClient(dio).getTotalSalaryMe({"date_year": dropdownValue});
    if (responseDTO.success) {
      return responseDTO.data!;
    }


    return List.empty();
  }

  void handleChange(String val, String type) {
    setState(() {
      dropdownValue = val;
    });
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
              child: new Dropdown(list: list, currVal: dropdownValue, handleChange: handleChange, id: "Year")
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