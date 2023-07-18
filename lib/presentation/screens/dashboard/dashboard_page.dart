import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_rest_sample/presentation/theme/context_extension.dart';

import '../../../generated/locale_keys.g.dart';
import '../../common/common_botton_container.dart';
import '../../router/app_router.dart';
import '../../theme/custom_icons.dart';
import '../../values/palette.dart';
import '../../values/values.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        WallRoute(),
        MapRoute(),
        FavoritesRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return Stack(
          children: [
            CupertinoTabBar(
              backgroundColor: Palette.whiteBackground,
              activeColor: Palette.activeIcon,
              inactiveColor: Palette.text,
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              height: Values.tabbarHeight,
              iconSize: 47,
              border: const Border(top: BorderSide(color: Colors.transparent)),
              items: [
                _buildBottomNavigationItem(context,
                    icon: CustomIcons.plate,
                    text: LocaleKeys.wallTitle.tr(),
                    isActive: tabsRouter.activeIndex == 0),
                _buildBottomNavigationItem(context,
                    icon: CustomIcons.map,
                    text: LocaleKeys.mapTitle.tr(),
                    isActive: tabsRouter.activeIndex == 1),
                _buildBottomNavigationItem(context,
                    icon: CustomIcons.favorite,
                    text: LocaleKeys.favoriteTitle.tr(),
                    isActive: tabsRouter.activeIndex == 2),
                _buildBottomNavigationItem(context,
                    icon: CustomIcons.profile,
                    text: LocaleKeys.profileTitle.tr(),
                    isActive: tabsRouter.activeIndex == 3),
              ],
            ),
            const CommonBottomContainer()
          ],
        );
      },
    );
  }

  BottomNavigationBarItem _buildBottomNavigationItem(BuildContext context,
      {required String text, required IconData icon, required bool isActive}) {
    return BottomNavigationBarItem(
        label: '',
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
            ),
            const SizedBox(height: 6),
            Text(text,
                style: context.style12w400subtitle?.copyWith(
                    fontSize: 10,
                    color: isActive ? Palette.activeIcon : Palette.text))
          ],
        ));
  }
}
