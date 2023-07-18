import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../generated/locale_keys.g.dart';
import '../../common/common_appbar.dart';
import '../../values/palette.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.background,
        extendBodyBehindAppBar: true,
        appBar: CommonAppBar(
          title: LocaleKeys.favoriteTitle.tr(),
        ));
  }
}
