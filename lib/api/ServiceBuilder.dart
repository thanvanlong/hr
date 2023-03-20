import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:untitled/store/SharePrefs.dart';

class ServiceBuilder {
  SharePrefs _sharePrefs = Get.find();
  Dio getService() {

    var dio = Dio();

    dio.interceptors.add(
      DioLoggingInterceptor(
        level: Level.body,
        compact: false,
      ),
    );
    
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.baseUrl = "https://hr-v2.tinasoft.vn/api/v1";
        options.headers['Authorization'] = "Bearer "  + _sharePrefs.accessToken;
        return handler.next(options);
      },
      onResponse: (response, handler) {

        return handler.next(response);
      },
      onError: (DioError e, handler) {

        return  handler.next(e);
      }
    ));
    return dio;
  }
}