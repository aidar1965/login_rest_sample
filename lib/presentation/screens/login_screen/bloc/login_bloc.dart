import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:login_rest_sample/data/api/http_client/request_exception.dart';
import 'package:login_rest_sample/domain/interfaces/i_user_repository.dart';

import '../../../../domain/interfaces/i_api_facade.dart';
import '../../../../domain/interfaces/i_auth_controller.dart';
import '../../../../locator/locator.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _StateInitial()) {
    on<LoginEvent>((event, emitter) => event.map(
        formSubmitted: (event) => _formSubmitted(
              event,
              emitter,
            )));
  }

  final IApiFacade api = getIt<IApiFacade>();
  final IAuthController authController = getIt<IAuthController>();
  final IUserRepository userRepository = getIt<IUserRepository>();

  Future<void> _formSubmitted(
      _EventFormSubmitted event, Emitter<LoginState> emitter) async {
    emitter(const LoginState.initial(
      isPending: true,
    ));
    try {
      final loginData = await api.login(
        email: event.email.trim(),
        password: event.password.trim(),
      );

      await userRepository.setUser(loginData.user);

      await authController.onAuthenticated(tokensPair: loginData.tokensPair);
    } on RequestException catch (e) {
      emitter(
          LoginState.requestError(errorText: e.response?['message'] as String));
      emitter(const LoginState.initial());
      log(e.toString());
    } on Object {
      emitter(const LoginState.requestError());
      emitter(const LoginState.initial());
      rethrow;
    }
  }
}
