// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LetterLeave.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LetterLeave _$LetterLeaveFromJson(Map<String, dynamic> json) => LetterLeave(
      json['id'] as int,
      json['startDate'] as String,
      json['reason'] as String,
      json['reasonRefuse'] as String?,
      (json['quantity'] as num).toDouble(),
      json['state'] as int,
      User.fromJson(json['user'] as Map<String, dynamic>),
      json['isCheck'] as bool,
    );

Map<String, dynamic> _$LetterLeaveToJson(LetterLeave instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate,
      'reason': instance.reason,
      'reasonRefuse': instance.reasonRefuse,
      'quantity': instance.quantity,
      'state': instance.state,
      'user': instance.user,
      'isCheck': instance.isCheck,
    };
