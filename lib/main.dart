import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/environment/di.dart';
import 'domain/environment/environment.dart';
import 'domain/interfaces/i_auth_controller.dart';
import 'presentation/router/app_router.dart';
// import 'presentation/theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // prepare environment
  final environment = await Environment.buildEnvironment();

  runApp(EasyLocalization(
    supportedLocales: const [Locale('ru', 'RU')],
    path: 'assets/languages',
    child: Di(
      environment: environment,
      child: Application(
        environment: environment,
      ),
    ),
  ));
}

// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
class Application extends StatefulWidget {
  const Application({
    Key? key,
    required this.environment,
  }) : super(key: key);

  final Map<Type, Object> environment;

  @override
  State<Application> createState() => ApplicationState();

  static ApplicationState of(BuildContext context) {
    return context.findAncestorStateOfType<ApplicationState>()!;
  }
}

class ApplicationState extends State<Application> {
  late AppRouter appRouter;
  late IAuthController authController;
  late bool _isAuthenticated;

  @override
  void didChangeDependencies() {
    authController = Di.of(context).g<IAuthController>()
      ..addChangeListener(() {
        setState(() {
          _isAuthenticated = authController.isAuthenticated;
        });
        appRouter = AppRouter(isAuthenticated: _isAuthenticated);
      });

    _isAuthenticated = authController.isAuthenticated;

    appRouter = AppRouter(isAuthenticated: _isAuthenticated);
    super.didChangeDependencies();
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
