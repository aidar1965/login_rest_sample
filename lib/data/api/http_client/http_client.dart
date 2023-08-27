import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../domain/interfaces/i_auth_controller.dart';
import 'i_api_request.dart';
import 'request_exception.dart';

class DioClient {
  // ---------------------------------------------------------------------------
  DioClient({bool useLocaleSettings = false}) {
    _initNewDioClient();
  }

  Dio? _dio;
  late BaseOptions _dioOptions;

  // ---------------------------------------------------------------------------
  static const bool debugMode = true;

  static const String _hostHttp = 'http';

  // static const String _hostUrl = 'smartbay.tools-2.webtronics.ru'; // stage
  static const String _hostUrl = '45.10.110.181:8080/'; //dev
  static const String _baseUrl = '$_hostHttp://$_hostUrl';

  // listener for authenticate events
  IAuthController? authenticateController;

  String get apiUrl => _baseUrl;

  // ---------------------------------------------------------------------------
  // инициализация HTTP-клиента с заданными настройками
  // и заголовком
  void _initNewDioClient({String accessToken = '', String? refreshToken}) {
    _dio?.interceptors.removeWhere((element) => true);

    // собираем данные для заголовка
    final Map<String, Object?> headers = {};

    _dioOptions = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: 25000,
      receiveTimeout: 25000,
      headers: headers,
    );
    _dio = Dio(_dioOptions);
  }

  // ---------------------------------------------------------------------------
  void setAuthenticateController(IAuthController controller) {
    authenticateController = controller;
  }

  // ---------------------------------------------------------------------------
  void removeAuthenticateController() {
    authenticateController = null;
  }

  // ---------------------------------------------------------------------------
  void _logger(String url, Response? response, {Object? body}) {
    const logger = print;
    // const logger = dev.log;

    logger('V___________________________________');
    logger(
        '> METHOD: ${response?.requestOptions.method.toString() ?? 'Unknown method'}');
    logger(
        '> HEADERS: ${response?.requestOptions.headers.toString() ?? 'Unknown headers'}');
    logger('> PATH: ${response?.requestOptions.path.toString() ?? url}');
    if (body != null) {
      if (body is FormData) {
        logger('> BODY: ${body.fields}');
      } else {
        logger('> BODY: $body');
      }
    }
    logger(
        '< STATUS: ${response?.statusCode?.toString() ?? 'Unknown statusCode'}');
    logger(
        '< RESPONSE: ${response?.data?.toString() ?? 'Response data is null'}');
    logger('^------------------------------------');
  }

  // ---------------------------------------------------------------------------
  Future<Response<Object?>?> request(IApiRequest request) async {
    if (_dio == null) throw UnimplementedError('Dio is not initialized');

    final String url = '$_baseUrl${request.endPoint}';
    try {
      Response<String> response;

      switch (request.methodType) {
        case AvailableApiMethods.get:
          response = await _dio!.get<String>(url);
          break;
        case AvailableApiMethods.post:
          response = await _dio!.post<String>(url, data: request.body);
          break;
        case AvailableApiMethods.put:
          response = await _dio!.put<String>(url, data: request.body);
          break;
        case AvailableApiMethods.delete:
          response = await _dio!.delete<String>(url, data: request.body);
          break;
        case AvailableApiMethods.patch:
          response = await _dio!.patch<String>(url, data: request.body);
          break;
      }

      if (debugMode) {
        _logger(url, response, body: request.body);
      }

      return response;
    } on DioError catch (dioError, stackTrace) {
      if (debugMode) {
        _logger(url, dioError.response, body: request.body);
      }

      Map<String, Object?>? responseBody;
      String? responseValues;
      if (dioError.response?.data != null) {
        if ('${dioError.response?.data}'.isNotEmpty) {
          final jsonDecoded = jsonDecode(dioError.response!.data as String);
          if (jsonDecoded is Map) {
            responseBody = jsonDecoded as Map<String, Object?>;
          } else if (jsonDecoded is Iterable) {
            final mapEntries = () sync* {
              for (final item in jsonDecoded) {
                if (item is Map) {
                  for (final k in item.entries) {
                    yield MapEntry<String, String>('${k.key}', '${k.value}');
                  }
                } else {
                  yield MapEntry<String, String>('', '$item');
                }
              }
            }();

            responseBody = Map<String, String>.fromEntries(mapEntries);
          } else {
            responseBody = <String, String>{'': '$jsonDecoded'};
          }

          String errorText = '';
          responseBody.forEach((key, value) {
            if (value is String) {
              errorText = errorText + value + '\n';
            } else if (value is Map<String, Object?>) {
              value.forEach((key, value) {
                if (value is String) {
                  errorText = errorText + value + '\n';
                }
              });
            } else if (value is List<Object?>) {
              value.forEach((item) {
                errorText = errorText + '$item\n';
              });
            }
          });
          if (errorText.isNotEmpty) {
            responseValues = errorText.trim();
          }
        }
      }
      Error.throwWithStackTrace(
          RequestException(
            httpStatusCode: dioError.response?.statusCode ?? 0,
            response: responseBody,
            responseValues: responseValues,
            requestPath: dioError.requestOptions.path,
            requestData: dioError.requestOptions.data,
            requestMethod: dioError.requestOptions.method,
          ),
          stackTrace);
    } on Object {
      rethrow;
    }
  }
}
