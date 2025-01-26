import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:homeegram/core/router/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:homeegram/core/config/theme/app_theme.dart';
import 'package:homeegram/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FlutterLocalization _localization = FlutterLocalization.instance;
    return MaterialApp.router(
      title: 'Homeegram',
      routerConfig: AppRouter.router,
      theme: AppTheme.lightTheme,
      locale: Locale('en'),
      supportedLocales: [Locale('en'), Locale('ml')],
      localizationsDelegates: [
        AppLocalizations.delegate,
        ..._localization.localizationsDelegates
      ],
    );
  }
}
