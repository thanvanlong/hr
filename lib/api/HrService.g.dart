// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HrService.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDTO<T> _$ResponseDTOFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ResponseDTO<T>(
      json['message'] as String,
      json['errorCode'] as String,
      json['success'] as bool,
      _$nullableGenericFromJson(json['data'], fromJsonT),
      Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseDTOToJson<T>(
  ResponseDTO<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': instance.message,
      'errorCode': instance.errorCode,
      'success': instance.success,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'meta': instance.meta,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

Auth _$AuthFromJson(Map<String, dynamic> json) => Auth(
      json['email'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      json['totalItems'] as int,
      json['totalPages'] as int,
      json['currentPage'] as int,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'totalItems': instance.totalItems,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://18.141.247.31:9001/api/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ResponseDTO<User>> login(auth) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(auth.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ResponseDTO<User>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/auth/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseDTO<User>.fromJson(
      _result.data!,
      (json) => User.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ResponseDTO<User>> getMe() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ResponseDTO<User>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/users/me',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseDTO<User>.fromJson(
      _result.data!,
      (json) => User.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ResponseDTO<List<Salary>>> getTotalSalaryMe(year) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'filter': year};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseDTO<List<Salary>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/total-salary/me',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseDTO<List<Salary>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<Salary>((i) => Salary.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<ResponseDTO<List<LetterLeave>>> getLetterLeaveMe(
    filter,
    pageNumber,
    pageSize,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'filter': filter,
      r'pageNumber': pageNumber,
      r'pageSize': pageSize,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseDTO<List<LetterLeave>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/letter-leave/me',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseDTO<List<LetterLeave>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<LetterLeave>(
              (i) => LetterLeave.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<ResponseDTO<LetterLeave>> createLetterLeave(letterLeave) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = letterLeave;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseDTO<LetterLeave>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/letter-leave',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseDTO<LetterLeave>.fromJson(
      _result.data!,
      (json) => LetterLeave.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ResponseDTO<LetterLeave>> deleteLetterLeave(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseDTO<LetterLeave>>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/letter-leave/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseDTO<LetterLeave>.fromJson(
      _result.data!,
      (json) => LetterLeave.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ResponseDTO<List<Event>>> getEvent(filter) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'sort[]': filter};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseDTO<List<Event>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/event',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseDTO<List<Event>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<Event>((i) => Event.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
