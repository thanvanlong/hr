import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../test.dart';

class AccountDetail extends StatefulWidget {
  const AccountDetail({Key? key}) : super(key: key);

  @override
  State<AccountDetail> createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lương tháng N',style: TextStyle(color: Colors.black),),
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: Color.fromRGBO(241, 242, 245, 1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text('Lương cứng:',style: TextStyle(color: Colors.blue),),
                            Text('3,000,000 VND'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Lương quản lý: ',style: TextStyle(color: Colors.blue),),
                            Text('0 VND'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TableSalary(),
              TableSalary(),
              TableSalary(),
              TableSalary(),
              Test(isOt: false,),
              Test(isOt: true,)
            ],
          ),
        ),
      ),
    );
  }
}

class TableSalary extends StatelessWidget {
  const TableSalary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text('Lương dự án:',style: TextStyle(color: Colors.blue),),
                      Text('300,000 VND'),
                    ],
                  )),
            ),
            Table(
              border: TableBorder.all(color: Colors.grey),
              children: [
                buildRow(['Dự án','Lương thưởng dự án'],isHeader: true),
                buildRow(['Easy1','300,000 VND'])
              ],
            )
          ],
        ),
      ),
    );
  }

  TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
      children: cells.map((cell) {
        if (isHeader) {
          return Container(
            color: Color(0xFFF6F6F6),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Center(child: Text(cell,style: TextStyle(fontWeight: FontWeight.bold),)),
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.all(30),
            child: Center(child: Text(cell)),
          );
        }
      }).toList()
  );
}





