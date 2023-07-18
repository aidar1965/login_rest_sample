part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial({@Default(false) bool isPending}) =
      _StateInitial;
  const factory LoginState.requestError({String? errorText}) = _StateError;
}
