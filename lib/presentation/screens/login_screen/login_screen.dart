import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:login_rest_sample/presentation/theme/context_extension.dart';

import '../../../domain/environment/di.dart';
import '../../../generated/locale_keys.g.dart';
import '../../common/common_appbar.dart';
import '../../common/common_botton_container.dart';
import '../../common/common_button.dart';

import '../../values/palette.dart';
import '../../values/values.dart';
import 'bloc/login_bloc.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    InputDecoration setDecoration({required String hint}) => InputDecoration(
        hintText: hint,
        hintStyle: context.style16w700button
            ?.copyWith(color: Palette.hint, fontWeight: FontWeight.w400),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: Values.horizontalPadding, vertical: 19),
        border: InputBorder.none,
        fillColor: Palette.white,
        filled: true);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return CupertinoPageScaffold(
        backgroundColor: Palette.background,
        navigationBar: CommonAppBar(
          title: LocaleKeys.authTitle.tr(),
        ),
        child: BlocProvider(
          create: (context) => Di.of(context).buildLoginBloc(),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) => state.mapOrNull(
              requestError: (state) => requestError(context, state.errorText),
            ),
            buildWhen: (previous, current) => current.maybeMap(
              orElse: () => false,
              initial: (_) => true,
            ),
            builder: (context, state) => state.maybeMap(
              orElse: () => throw UnimplementedError(),
              initial: (state) {
                return KeyboardVisibilityBuilder(
                  builder: (context, isKeyboardVisible) {
                    return Stack(
                      children: [
                        ListView(
                          children: [
                            const SizedBox(
                              height: 224,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Material(
                                  child: TextFormField(
                                    controller: emailController,
                                    decoration: setDecoration(
                                        hint: LocaleKeys.authEmailHint.tr()),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: Values.horizontalPadding,
                                    right: Values.horizontalPadding,
                                  ),
                                  child: Divider(
                                    height: 1,
                                  ),
                                ),
                                Material(
                                  child: TextFormField(
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: setDecoration(
                                        hint: LocaleKeys.authPasswordHint.tr()),
                                  ),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Values.horizontalPadding),
                                  child: CommonAccentButton(
                                    isPending: state.isPending,
                                    isExpanded: true,
                                    text: LocaleKeys.authEnterButton.tr(),
                                    onPressed: () {
                                      BlocProvider.of<LoginBloc>(context).add(
                                        LoginEvent.formSubmitted(
                                            email: emailController.text,
                                            password: passwordController.text),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 19,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Values.horizontalPadding),
                                  child: CommonAccentButton(
                                    isExpanded: true,
                                    text: LocaleKeys.authRegisterButton.tr(),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (!isKeyboardVisible) const CommonBottomContainer(),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ));
  }

  void requestError(BuildContext context, String? errorText) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(LocaleKeys.labelError.tr()),
        content: errorText != null ? Text(errorText) : null,
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ок'),
          ),
        ],
      ),
    );
  }
}
