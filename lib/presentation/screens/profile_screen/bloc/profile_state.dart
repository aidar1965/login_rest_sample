part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial({
    required User user,
  }) = _StateInitial;
  const factory ProfileState.pending() = _StatePending;
}
