import 'package:json_annotation/json_annotation.dart';

part 'Event.g.dart';
@JsonSerializable()

class Event {
  final int id;
  final String title;
  final String content;
  final DateTime startDate;
  final DateTime endDate;

  Event(this.id, this.title, this.content, this.startDate, this.endDate);

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);

}