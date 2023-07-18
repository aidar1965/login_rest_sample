import 'package:auto_route/auto_route.dart';

import '../../domain/interfaces/i_auth_controller.dart';
import '../screens/dashboard/dashboard_page.dart';
import '../screens/favorites_screen/favorites_screen.dart';
import '../screens/login_screen/login_screen.dart';
import '../screens/map_screen/map_screen.dart';
import '../screens/profile_screen/profile_screen.dart';
import '../screens/wall_screen/wall_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  AppRouter({
    required this.isAuthenticated,
  });

  final bool isAuthenticated;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DashboardRoute.page, path: '/', children: [
          AutoRoute(
            page: WallRoute.page,
            path: 'wall',
          ),
          AutoRoute(
            page: MapRoute.page,
            path: 'map',
          ),
          AutoRoute(
            page: FavoritesRoute.page,
            path: 'favorite',
          ),
          AutoRoute(
            page: ProfileRoute.page,
            path: 'profile',
          ),
        ]),
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        )
      ];

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (isAuthenticated || resolver.route.name == LoginRoute.name) {
      // we continue navigation
      resolver.next();
    } else {
      // else we navigate to the Login page so we get authenticateed
      push(LoginRoute());
    }
  }
}
