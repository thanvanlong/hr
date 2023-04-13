import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:untitled/model/Event.dart';
import 'package:untitled/model/LetterLeave.dart';
import 'package:untitled/model/Salary.dart';

import '../model/User.dart';

part 'HrService.g.dart';

@RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/auth/login")
  Future<ResponseDTO<User>> login(@Body() Auth auth);

  @GET("/users/me")
  Future<ResponseDTO<User>> getMe();

  @GET("/total-salary/me")
  Future<ResponseDTO<List<Salary>>> getTotalSalaryMe(@Query("filter") Object? year);

  @GET("/letter-leave/me")
  Future<ResponseDTO<List<LetterLeave>>> getLetterLeaveMe(@Query("filter") Object filter, @Query("pageNumber") int pageNumber, @Query("pageSize") int pageSize);

  @POST("/letter-leave")
  Future<ResponseDTO<LetterLeave>> createLetterLeave(@Body() Object letterLeave);

  @DELETE("/letter-leave/{id}")
  Future<ResponseDTO<LetterLeave>> deleteLetterLeave(@Path("id") int id);

}


@JsonSerializable(genericArgumentFactories: true)
class ResponseDTO<T> {
  final String message;
  final String errorCode;
  final bool success;
  final T? data;
  final Meta meta;
  ResponseDTO(this.message, this.errorCode, this.success, this.data, this.meta);

  factory ResponseDTO.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) => _$ResponseDTOFromJson(json, fromJsonT);
  // Map<String, dynamic> toJson() => _$ResponseDTOToJson(this);
}
@JsonSerializable()
class Auth{
  final String email;
  final String password;

  Auth(this.email, this.password);
  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
  Map<String, dynamic> toJson() => _$AuthToJson(this);

}

@JsonSerializable()
class Meta{
  final int totalItems;
  final int totalPages;
  final int currentPage;

  Meta(this.totalItems, this.totalPages, this.currentPage);

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);


}