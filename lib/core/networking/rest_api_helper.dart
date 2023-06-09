import 'dart:convert';
import 'package:dio/dio.dart' as Dio;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:zabardash/core/utils/preference_keys.dart';

import '../../config.dart';
import '../di/dependency_injection.dart';
import '../utils/pref_utils.dart';

class RestApiHelper {
  final dio = Dio.Dio();
  final _baseUrl = Config.baseUrl;
  PreferenceUtils _preferenceUtils = locator<PreferenceUtils>();

  Future<Dio.Dio> getApiClient() async {
    try {
      String token =
          await _preferenceUtils.getStringData(PreferenceKeys.ACCESS_TOKEN);
      dio.interceptors.clear();
      dio.options.baseUrl = _baseUrl;
      dio.options.connectTimeout = 10000;
      dio.options.receiveTimeout = 10000;
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ));
      dio.interceptors.add(
        Dio.InterceptorsWrapper(
          onRequest: (options, interceptorHandler) {
            // Do something before request is sent
            if (token.length > 5) {
              options.headers = {
                "Authorization": "Bearer " + token.toString(),
                "Accept": "application/json",
                "Content-type": "application/json"
              };
            } else {
              options.headers = {
                "Accept": "application/json",
                "Content-type": "application/json"
              };
            }
            return interceptorHandler.next(options);
            // ignore: non_constant_identifier_names
          },
          onResponse: (response, interceptorHandler) {
            // Do something with response data
            return interceptorHandler.next(response); // continue
            // ignore: non_constant_identifier_names
          },
          onError: (error, interceptorHandler) async {
            // Do something with response error
            if (error.response?.statusCode == 403 ||
                error.response?.statusCode == 401) {
              dio.interceptors.requestLock.lock();
              dio.interceptors.responseLock.lock();
              // ignore: unused_local_variable
              Dio.RequestOptions options = error.response!.requestOptions;
              // ignore: unused_local_variable
              Dio.Options? opt;
              options.headers["Authorization"] = "Bearer " + token;
              dio.interceptors.requestLock.unlock();
              dio.interceptors.responseLock.unlock();
              //  return _dio.request(options.path, options: opt);
            } else {
              return interceptorHandler.next(error);
            }
          },
        ),
      );
      //  _dio.options.baseUrl = baseUrl;
    } catch (err) {
      // print("Dio Error: ${err.toString()}");
      throw err;
    }

    return dio;
  }

  Future<Dio.Response> get(url, {Map<String, dynamic>? body}) async {
    String params = "?";
    body?.forEach((key, value) {
      params += "$key=$value&";
    });
    if (params == "?") {
      params = "";
    }
    url = "$_baseUrl$url$params";
    // ignore: avoid_print
    var dio = await getApiClient();
    final response = await dio.get(
      url,
    );
    return response;
  }

  Future<Dio.Response> post(
    url, {
    Map<String, dynamic>? body,
    isFormData,
  }) async {
    Dio.FormData formData = Dio.FormData.fromMap(body!);
    var dio = await getApiClient();
    final response = await dio.post(
      "$_baseUrl$url",
      data: isFormData ? formData : jsonEncode(body),
    );
    return response;
  }

  Future<Dio.Response> put(
    url, {
    Map<String, dynamic>? body,
  }) async {
    final data = json.encode(body);
    var dio = await getApiClient();
    final response = await dio.put(
      "$_baseUrl$url",
      data: jsonEncode(body),
    );
    return response;
  }

  Future<Dio.Response> delete(
    url, {
    Map<String, dynamic>? body,
  }) async {
    var dio = await getApiClient();
    final response = await dio.delete(
      "$_baseUrl$url",
      data: jsonEncode(body),
    );
    return response;
  }


   Future<Dio.Response> patch_api(
      url, {
    Map<String, dynamic>? body,
    isFormData,
  }) async {
    Dio.FormData formData = Dio.FormData.fromMap(body!);
    var dio = await getApiClient();
    final response = await dio.patch(
      "$_baseUrl$url",
      data: isFormData ? formData : jsonEncode(body),

    );
    return response;
  }
}
