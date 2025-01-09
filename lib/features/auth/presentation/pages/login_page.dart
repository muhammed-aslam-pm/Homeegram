import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _localization = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_localization!.loginWelcome),
      ),
    );
  }
}
