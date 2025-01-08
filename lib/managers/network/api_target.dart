

import '../logger/logger_manager.dart';
import 'api_authorization_type.dart';
import 'api_method.dart';

abstract class APITarget {
  String baseURL = 'https://rickandmortyapi.com/api/';

  late String path;

  APIMethod method = APIMethod.get;

  Map<String, String> headers = {};

  Map<String, dynamic> queryParameters = {};

  Object? body;

  APIAuthorizationType authorizationType = APIAuthorizationType.none;
}

extension APITargetLogger on APITarget {
  log() {
    LoggerManager.instance.trace('''
    $this
    BaseURL: $baseURL
    Path: $path
    Headers: $headers
    Method: $method
    Body: $body
    QueryParameters: $queryParameters
''');
  }
}
