import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../interfaces/i_auth_controller.dart';

part 'auth_controller_event.dart';
part 'auth_controller_state.dart';
part 'auth_controller_bloc.freezed.dart';

@DepGen()
class AuthControllerBloc
    extends Bloc<AuthControllerEvent, AuthControllerState> {
  AuthControllerBloc({@DepArg() required this.authController})
      : super(authController.isAuthenticated
            ? const AuthControllerState.authenticated()
            : const AuthControllerState.notAuthenticated()) {
    on<AuthControllerEvent>(
      (event, emitter) => event.map(
        authStatusChanged: (event) => authStatusChanged(emitter),
      ),
    );
    authController.addChangeListener(() => onAuthStatusChanged());
  }

  final IAuthController authController;
  bool get isAuthenticated => authController.isAuthenticated;

  void onAuthStatusChanged() {
    add(const AuthControllerEvent.authStatusChanged());
  }

  void authStatusChanged(Emitter<AuthControllerState> emitter) {
    emitter(authController.isAuthenticated
        ? const AuthControllerState.authenticated()
        : const AuthControllerState.notAuthenticated());
  }
}
