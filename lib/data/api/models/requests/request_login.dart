import '../../http_client/i_api_request.dart';

class RequestLogin extends IApiRequest {
  RequestLogin({
    required this.email,
    required this.password,
  }) : super(
          methodType: AvailableApiMethods.post,
          url: 'api/v1/auth/login',
        );

  final String email;
  final String password;

  @override
  Map<String, Object?>? get body => {
        'email': email,
        'password': password,
      };
}
