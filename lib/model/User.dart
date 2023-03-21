import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';
@JsonSerializable()
class User {
  final int id;
  final String accessToken;
  final String refreshToken;
  final String email;
  final String password;
  final String avatar;
  final String fullName;



  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  User(this.id, this.accessToken, this.refreshToken, this.email, this.password, this.avatar, this.fullName);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}