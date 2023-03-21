import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/api/ServiceBuilder.dart';
import 'package:untitled/model/Salary.dart';
import 'package:dio/dio.dart';
import 'package:untitled/ui/AccountManager/accountDetail.dart';
import 'package:untitled/ui/loginScreen/login_screen.dart';

class SalaryBox extends StatefulWidget {
  const SalaryBox({Key? key, required this.salary}) : super(key: key);

  final Salary salary;


  @override
  State<SalaryBox> createState() => _SalaryBoxState();
}

class _SalaryBoxState extends State<SalaryBox> {
  void goToDetailSalary () {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AccountDetail()));
  }
  @override
  Widget build(BuildContext context) {
    var moneyConfig = NumberFormat.currency(locale: "vi",
        symbol: "VND");
    return InkWell(
      onTap: goToDetailSalary,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.45,
        margin: new EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: const EdgeInsets.all(8), child: Text('Tháng ${DateTime.parse(widget.salary.date).month}',style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 25)),),
                Padding(padding: const EdgeInsets.all(3), child: Text(moneyConfig.format(widget.salary.afterTaxSalary),style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12)),),
              ],
            ),
            Padding(padding: new EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 10), child: Text('Lương cứng', style: TextStyle(color: Colors.black87, fontSize: 10),),),
                  Padding(padding: EdgeInsets.only(top: 10), child: Text('Thưởng dự án', style: TextStyle(color: Colors.black87, fontSize: 10),),),
                  Padding(padding: EdgeInsets.only(top: 10), child: Text('Lương làm thêm', style: TextStyle(color: Colors.black87, fontSize: 10),),),
                  Padding(padding: EdgeInsets.only(top: 10), child: Text('Lương khấu trừ', style: TextStyle(color: Colors.black87, fontSize: 10),),),
                  Padding(padding: EdgeInsets.only(top: 10), child: Text('Lương onesite', style: TextStyle(color: Colors.black87, fontSize: 10),),),
                  Padding(padding: EdgeInsets.only(top: 10), child: Text('Lương tổng trước thuế', style: TextStyle(color: Colors.black87, fontSize: 10),),),
                  Padding(padding: EdgeInsets.only(top: 10), child: Text('Lương tổng sau thuế', style: TextStyle(color: Colors.black87, fontSize: 10),),),
                ],
              ),
            ),
            Padding(padding: new EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 10), child: Text(moneyConfig.format(widget.salary.baseSalary), style: TextStyle(color: Colors.black87, fontSize: 10),),),
                  Padding(padding: EdgeInsets.only(top: 10), child: Text(moneyConfig.format(widget.salary.bonusSalary), style: TextStyle(color: Colors.black87, fontSize: 10),),),
                  Padding(padding: EdgeInsets.only(top: 10), child: Text(moneyConfig.format(widget.salary.overtimeSalary), style: TextStyle(color: Colors.black87, fontSize: 10),),),
                  Padding(padding: EdgeInsets.only(top: 10), child: Text(moneyConfig.format(widget.salary.deductionSalary), style: TextStyle(color: Colors.black87, fontSize: 10),),),
                  Padding(padding: EdgeInsets.only(top: 10), child: Text(moneyConfig.format(widget.salary.onsiteSalary), style: TextStyle(color: Colors.black87, fontSize: 10),),),
                  Padding(padding: EdgeInsets.only(top: 10), child: Text(moneyConfig.format(widget.salary.totalSalary), style: TextStyle(color: Colors.black87, fontSize: 10),),),
                  Padding(padding: EdgeInsets.only(top: 10), child: Text(moneyConfig.format(widget.salary.afterTaxSalary), style: TextStyle(color: Colors.black87, fontSize: 10),),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
