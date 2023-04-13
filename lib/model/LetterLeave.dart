import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/model/User.dart';

part 'LetterLeave.g.dart';
@JsonSerializable()
class LetterLeave{
  final int id;
  final String startDate;
  final String reason;
  final String? reasonRefuse;
  final double quantity;
  final int state;
  final User user;
  bool isCheck = false;

  LetterLeave(this.id, this.startDate, this.reason, this.reasonRefuse, this.quantity, this.state, this.user, this.isCheck);

  factory LetterLeave.fromJson(Map<String, dynamic> json) => _$LetterLeaveFromJson(json);
  Map<String, dynamic> toJson() => _$LetterLeaveToJson(this);
}

