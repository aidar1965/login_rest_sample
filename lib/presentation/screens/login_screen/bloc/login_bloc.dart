import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:login_rest_sample/data/api/http_client/request_exception.dart';
import 'package:login_rest_sample/domain/interfaces/i_user_repository.dart';

import '../../../../domain/interfaces/i_api_facade.dart';
import '../../../../domain/interfaces/i_auth_controller.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

@DepGen()
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
      {@DepArg() required this.api,
      @DepArg() required this.authController,
      @DepArg() required this.userRepository})
      : super(const _StateInitial()) {
    on<LoginEvent>((event, emitter) => event.map(
        formSubmitted: (event) => _formSubmitted(
              event,
              emitter,
            )));
  }

  final IApiFacade api;
  final IAuthController authController;
  final IUserRepository userRepository;

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
