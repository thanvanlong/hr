import 'package:json_annotation/json_annotation.dart';


part 'DetailTaxSalary.g.dart';
@JsonSerializable()
class DetailTaxSalary {
  final int deductionFamilyCircumstances;
  final int deductionOwn;
  final int tax;
  final int taxSalary;
  final int taxableSalary;

  DetailTaxSalary(this.deductionFamilyCircumstances, this.deductionOwn,
      this.tax, this.taxSalary, this.taxableSalary);

  factory DetailTaxSalary.fromJson(Map<String, dynamic> json) => _$DetailTaxSalaryFromJson(json);
  Map<String, dynamic> toJson() => _$DetailTaxSalaryToJson(this);
}