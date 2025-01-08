import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:network_inspector/common/utils/dio_interceptor.dart';
import 'package:network_inspector/network_inspector.dart';
import 'package:rick_and_morty_characters_explorer/managers/snack_bar/snack_bar_manager.dart';

import '../cache/cache.dart';
import '../cache/cache_key.dart';
import '../headers/headers_manager.dart';
import '../logger/logger_manager.dart';
import 'api_authorization_type.dart';
import 'api_method.dart';
import 'api_target.dart';


class APIManager {
  late Dio _client = Dio();

  APIManager._privateConstructor() {
    _client = Dio();
    _setupClient();
  }

  // Static final instance
  static final APIManager _instance = APIManager._privateConstructor();

  // Static method
  static APIManager get instance {
    return _instance;
  }

  _setupClient() {
    _setupBaseOptions();
    _setupLoggerInterceptor();
  }

  _setupLoggerInterceptor() {
    if (!kReleaseMode) {
      _client.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
      _client.interceptors.add(DioInterceptor(
          isConsoleLogAllowed: false, networkInspector: NetworkInspector()));
    }
  }

  _setupBaseOptions() {
    _client.options = BaseOptions(validateStatus: (status) {
      return status != null;
    });
  }

  _defaultHeaders() async {
    _client.options.headers.addAll(HeadersManager.instance.headers ?? {'': ''});
  }

  _setupBaseURL(APITarget apiTarget) {
    _client.options.baseUrl = apiTarget.baseURL;
    LoggerManager.instance.trace(_client.options.baseUrl);
  }

  _setupHeaders(APITarget apiTarget) async {
    await _defaultHeaders();
    switch (apiTarget.authorizationType) {
      case APIAuthorizationType.bearer:
        await Cache.instance
            .retrive(CacheKey.accessToken)
            .then((value) => _client.options.headers.addAll({
                  'Authorization': 'Bearer $value',
                }));
      case APIAuthorizationType.none:
    }
    _client.options.headers.addAll(apiTarget.headers);
    LoggerManager.instance.trace(_client.options.headers);
  }

  Future<Map<String, dynamic>?> request<T>(
      APITarget apiTarget) async {
    Response response = await _requset(apiTarget);
    LoggerManager.instance.trace(response.statusCode);
    LoggerManager.instance.trace(response.data);

    if (response.statusCode == 404) {
      SnackBarManager.showErrorMessage(response.data['error'] ?? "something want wrong!");
    }
    if (response.data == null) {
      return null;
    }
    if (response.data is Map<String, dynamic>) {
      return response.data as Map<String, dynamic>;
    } else {
      LoggerManager.instance.trace('Cannot parese resposne ${response.data}');
      return null;
    }
  }

  Future<Response> _requset(APITarget apiTarget) async {
    _setupBaseURL(apiTarget);
    await _setupHeaders(apiTarget);
    switch (apiTarget.method) {
      case APIMethod.get:
        return await _client.get(apiTarget.path,
            queryParameters: apiTarget.queryParameters);
      case APIMethod.delete:
        return await _client.delete(apiTarget.path,
            data: apiTarget.body, queryParameters: apiTarget.queryParameters);
      case APIMethod.patch:
        return await _client.patch(apiTarget.path,
            data: apiTarget.body, queryParameters: apiTarget.queryParameters);
      case APIMethod.post:
        return await _client.post(apiTarget.path,
            data: apiTarget.body, queryParameters: apiTarget.queryParameters);
      case APIMethod.put:
        return await _client.put(apiTarget.path,
            data: apiTarget.body, queryParameters: apiTarget.queryParameters);
    }
  }
}
