// ignore_for_file: avoid_print
import
 'package:dio/dio.dart';
import 'package:zabardash/core/networking/rest_api_helper.dart';
import 'package:zabardash/models/base_response.dart';
import 'auth_manager.dart';
import 'dio_exceptions.dart';

enum HttpMethod { GET, POST, PUT, DELETE }

class ApiManager {
  ApiManager._();

  static final ApiManager instance = ApiManager._();

  final _helper = RestApiHelper();

  Future<BaseResponse> request(
      String endPoint, HttpMethod method, Map<String, dynamic>? params,
      {bool isFormData = false}) async {
    return requestWithUrl("$endPoint", method, params, isFormData);
  }

  Future<BaseResponse> requestWithUrl(String url, HttpMethod method,
      Map<String, dynamic>? params, bool? isFormData) async {
    params ??= <String, String>{};
    Response? response;
    try {
      switch (method) {
        case HttpMethod.GET:
          response = await _helper.get(url, body: params);
          break;
        case HttpMethod.POST:
          response =
              await _helper.post(url, body: params, isFormData: isFormData);
              
          break;

          case HttpMethod.PUT:
          response =
              await _helper.patch_api(url, body: params, isFormData: isFormData);
              
          break;
        case HttpMethod.PUT:
          response = await _helper.put(url, body: params);
          break;
        case HttpMethod.DELETE:
          response = await _helper.delete(url, body: params);
          break;
        default:
          break;
      }
      final st = _parseResponse(response!);
      return st;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      // print("Dio Response in catch:1 " + errorMessage);
      throw errorMessage;
    }
  }

  BaseResponse _parseResponse(Response response) {
    try {
      final baseResponse = BaseResponse.fromJson(response.data);
      return baseResponse;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      // print("Dio Response in catch:2 " + errorMessage);
      throw errorMessage;
    }
  }
}
