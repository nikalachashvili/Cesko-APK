import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:voters/app/main_shell.dart';
import 'package:voters/core/theme/app_theme.dart';

class VotersApp extends StatelessWidget {
  const VotersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voters',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      locale: const Locale('ka'),
      supportedLocales: const [Locale('ka')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      builder: (context, child) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: child!,
      ),
      home: const MainShell(),
    );
  }
}
