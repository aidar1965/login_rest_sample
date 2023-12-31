import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/interfaces/i_user_repository.dart';
import '../../../../domain/models/user.dart';
import '../../../../locator/locator.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const _StatePending()) {
    on<ProfileEvent>((event, emitter) => event.map(
        logout: (event) => _logout(),
        userDataRequested: (event) => _userDataRequested(event, emitter)));
    add(const ProfileEvent.userDataRequested());
  }

  final IUserRepository userRepository = getIt<IUserRepository>();

  Future<void> _logout() async {
    await userRepository.logout();
  }

  Future<void> _userDataRequested(
      _EventUserDataRequested event, Emitter<ProfileState> emitter) async {
    final user = await userRepository.getUser();
    if (user != null) {
      emitter(ProfileState.initial(user: user));
    } else {
      await userRepository.logout();
    }
  }
}
