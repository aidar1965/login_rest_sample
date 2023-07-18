part of 'auth_controller_bloc.dart';

@freezed
class AuthControllerState with _$AuthControllerState {
  const factory AuthControllerState.authenticated() = _StateAuthenticated;
  const factory AuthControllerState.notAuthenticated() = _StateNotAuthenticated;
}
