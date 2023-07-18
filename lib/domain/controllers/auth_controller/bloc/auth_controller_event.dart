part of 'auth_controller_bloc.dart';

@freezed
class AuthControllerEvent with _$AuthControllerEvent {
  const factory AuthControllerEvent.authStatusChanged() =
      _EventAuthStatusChanged;
}
