import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'domain/interfaces/i_auth_controller.dart';

import 'locator/locator.dart';
import 'presentation/router/app_router.dart';
// import 'presentation/theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setup();
  await getIt.allReady();

  runApp(EasyLocalization(
    supportedLocales: const [Locale('ru', 'RU')],
    path: 'assets/languages',
    child: const Application(),
  ));
}

// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => ApplicationState();

  static ApplicationState of(BuildContext context) {
    return context.findAncestorStateOfType<ApplicationState>()!;
  }
}

class ApplicationState extends State<Application> {
  late AppRouter appRouter;
  final IAuthController authController = getIt<IAuthController>();

  late bool _isAuthenticated;

  @override
  void initState() {
    super.initState();
    _isAuthenticated = authController.isAuthenticated;
    appRouter = AppRouter(isAuthenticated: _isAuthenticated);
    authController.addChangeListener(() {
      setState(() {
        _isAuthenticated = authController.isAuthenticated;
      });
      appRouter = AppRouter(isAuthenticated: _isAuthenticated);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      // theme: AppTheme.getTheme(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: EasyLocalization.of(context)!.supportedLocales,
      locale: EasyLocalization.of(context)!.locale,
      debugShowCheckedModeBanner: false,
    );
  }
}
