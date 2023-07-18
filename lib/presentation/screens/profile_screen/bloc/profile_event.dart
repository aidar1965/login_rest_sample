part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.logout() = _EventLogout;
  const factory ProfileEvent.userDataRequested() = _EventUserDataRequested;
}
