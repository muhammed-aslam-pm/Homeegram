import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:homeegram/core/router/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:homeegram/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final FlutterLocalization _localization = FlutterLocalization.instance;
    return MaterialApp.router(
      title: 'Homeegram',
      routerConfig: AppRouter.router,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
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
