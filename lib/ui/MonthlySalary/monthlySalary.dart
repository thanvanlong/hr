import 'package:flutter/material.dart';
class MonthlySalary extends StatefulWidget {
  const MonthlySalary({Key? key}) : super(key: key);

  @override
  State<MonthlySalary> createState() => _MonthlySalaryState();
}

class _MonthlySalaryState extends State<MonthlySalary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Đây là trang quản lý bảng lương'),),
    );
  }
}
