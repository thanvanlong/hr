// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DetailTaxSalary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailTaxSalary _$DetailTaxSalaryFromJson(Map<String, dynamic> json) =>
    DetailTaxSalary(
      json['deductionFamilyCircumstances'] as int,
      json['deductionOwn'] as int,
      json['tax'] as int,
      json['taxSalary'] as int,
      json['taxableSalary'] as int,
    );

Map<String, dynamic> _$DetailTaxSalaryToJson(DetailTaxSalary instance) =>
    <String, dynamic>{
      'deductionFamilyCircumstances': instance.deductionFamilyCircumstances,
      'deductionOwn': instance.deductionOwn,
      'tax': instance.tax,
      'taxSalary': instance.taxSalary,
      'taxableSalary': instance.taxableSalary,
    };
