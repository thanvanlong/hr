import 'package:json_annotation/json_annotation.dart';

import 'DetailTaxSalary.dart';
import 'User.dart';

part 'Salary.g.dart';
@JsonSerializable()
class Salary {
  final int totalSalary;
  final int bonusProj;
  final int deductionSalary;
  final int onsiteSalary;
  final int discountSalary;
  final User user;
  final int afterTaxSalary;
  final int baseSalary;
  final int bonusSalary;
  final int manageSalary;
  final int overtimeSalary;
  final int projectSalary;
  final DetailTaxSalary detailTaxSalary;
  final int hourOT;
  final String date;


  Salary(
      this.totalSalary,
      this.bonusProj,
      this.deductionSalary,
      this.onsiteSalary,
      this.discountSalary,
      this.user,
      this.afterTaxSalary,
      this.baseSalary,
      this.bonusSalary,
      this.manageSalary,
      this.overtimeSalary,
      this.projectSalary,
      this.detailTaxSalary,
      this.hourOT, this.date);

  factory Salary.fromJson(Map<String, dynamic> json) => _$SalaryFromJson(json);
  Map<String, dynamic> toJson() => _$SalaryToJson(this);



}