// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Salary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Salary _$SalaryFromJson(Map<String, dynamic> json) => Salary(
      json['totalSalary'] as int,
      json['bonusProj'] as int,
      json['deductionSalary'] as int,
      json['onsiteSalary'] as int,
      json['discountSalary'] as int,
      User.fromJson(json['user'] as Map<String, dynamic>),
      json['afterTaxSalary'] as int,
      json['baseSalary'] as int,
      json['bonusSalary'] as int,
      json['manageSalary'] as int,
      json['overtimeSalary'] as int,
      json['projectSalary'] as int,
      DetailTaxSalary.fromJson(json['detailTaxSalary'] as Map<String, dynamic>),
      json['hourOT'] as int,
      json['date'] as String,
    );

Map<String, dynamic> _$SalaryToJson(Salary instance) => <String, dynamic>{
      'totalSalary': instance.totalSalary,
      'bonusProj': instance.bonusProj,
      'deductionSalary': instance.deductionSalary,
      'onsiteSalary': instance.onsiteSalary,
      'discountSalary': instance.discountSalary,
      'user': instance.user,
      'afterTaxSalary': instance.afterTaxSalary,
      'baseSalary': instance.baseSalary,
      'bonusSalary': instance.bonusSalary,
      'manageSalary': instance.manageSalary,
      'overtimeSalary': instance.overtimeSalary,
      'projectSalary': instance.projectSalary,
      'detailTaxSalary': instance.detailTaxSalary,
      'hourOT': instance.hourOT,
      'date': instance.date,
    };
