import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_rest_sample/presentation/theme/context_extension.dart';

import '../../../domain/environment/di.dart';
import '../../../generated/locale_keys.g.dart';
import '../../common/common_appbar.dart';
import '../../common/common_button.dart';
import '../../common/common_progress_indicator.dart';
import '../../theme/custom_icons.dart';
import '../../values/palette.dart';
import '../../values/values.dart';
import 'bloc/profile_bloc.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Palette.background,
      navigationBar: CommonAppBar(
        title: LocaleKeys.authTitle.tr(),
      ),
      child: BlocProvider(
        create: (context) => Di.of(context).buildProfileBloc(),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) => state.map(
            initial: (state) => Column(
              children: [
                const SizedBox(height: 38),
                const Icon(
                  CustomIcons.profile,
                  size: 64,
                ),
                const SizedBox(height: 15),
                Text(
                  state.user.nickName,
                  style: context.style16w700button?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Palette.text),
                ),
                const SizedBox(height: 12),
                Text(
                  state.user.email,
                  style: context.style16w700button?.copyWith(
                      fontWeight: FontWeight.w400, color: Palette.textLight),
                ),
                const SizedBox(height: 27),
                Material(
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<ProfileBloc>(context)
                          .add(const ProfileEvent.logout());
                    },
                    child: Ink(
                      height: 55,
                      color: Palette.whiteBackground,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              LocaleKeys.profileLogout.tr(),
                              style: context.style15w400body
                                  ?.copyWith(fontSize: 16, color: Palette.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            pending: (_) => const Center(
              child: CommonProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
