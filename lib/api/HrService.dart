import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'HrService.g.dart';

@RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/auth/login")
  Future<ResponseDTO> login(@Body() Auth auth);

  @GET("/users/me")
  Future<ResponseDTO> getMe();

  @GET("/total-salary/me")
  Future<ResponseDTO> getTotalSalaryMe(@Query("filter") Object year);
}

@JsonSerializable()
class Task {
  String? id;
  String? name;
  String? avatar;
  String? createdAt;

  Task({this.id, this.name, this.avatar, this.createdAt});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

@JsonSerializable()
class ResponseDTO {
  final String message;
  final String errorCode;
  final bool success;
  final dynamic data;

  ResponseDTO(this.message, this.errorCode, this.success, this.data);

  factory ResponseDTO.fromJson(Map<String, dynamic> json) => _$ResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDTOToJson(this);
}
@JsonSerializable()
class Auth{
  final String email;
  final String password;

  Auth(this.email, this.password);
  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
  Map<String, dynamic> toJson() => _$AuthToJson(this);

}