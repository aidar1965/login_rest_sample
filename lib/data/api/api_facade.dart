import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:login_rest_sample/data/api/models/requests/request_login.dart';
import 'package:login_rest_sample/data/api/models/responses/login_result_dto.dart';
import 'package:login_rest_sample/domain/models/tokens_pair.dart';
import 'package:login_rest_sample/domain/models/login_result.dart';
import 'package:login_rest_sample/domain/interfaces/i_auth_controller.dart';

import '../../domain/interfaces/i_api_facade.dart';

import '../../locator/locator.dart';
import 'http_client/http_client.dart';
import 'mapper/mapper.dart';

typedef _Response = Response<Object?>?;
typedef _JsonObject = Map<String, Object?>;

class ApiFacade implements IApiFacade {
  // ---------------------------------------------------------------------------

  final httpClient = getIt<DioClient>();

  @override
  ApiDataMapper? mapper = getIt<ApiDataMapper>();

  @override
  Future<void> clearTokens() {
    // TODO: implement clearTokens
    throw UnimplementedError();
  }

  @override
  Future<LoginResult> login(
      {required String email, required String password}) async {
    final _Response response = await httpClient.request(
      RequestLogin(
        email: email,
        password: password,
      ),
    );
    return mapper!.mapLoginResult(LoginResultDto.fromJson(
        jsonDecode('${response?.data}') as _JsonObject));
  }

  @override
  Future<TokensPair> refreshTokens({required String refreshToken}) {
    // TODO: implement refreshTokens
    throw UnimplementedError();
  }

  @override
  void removeAuthenticateController() {
    // TODO: implement removeAuthenticateController
  }

  @override
  void setAuthenticateController(IAuthController controller) {
    // TODO: implement setAuthenticateController
  }

  @override
  Future<void> setTokens(String access, String refresh) {
    // TODO: implement setTokens
    throw UnimplementedError();
  }
}
