import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nsh7nha/components/helper/secure_storage.dart';
import 'package:nsh7nha/generated/l10n.dart';
import 'package:nsh7nha/route/route_constants.dart';
import 'package:nsh7nha/route/router.dart';
import 'package:nsh7nha/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String token = await SecureStorage().getToken() ?? '';
  // print(token);
  // await SecureStorage().deleteToken();
  // print(token);
  runApp(MyApp(
    token: token,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.token});

  final String token;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Shop Template by The Flutter Way',
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      themeMode: ThemeMode.light,
      // onGenerateRoute: router.generateRoute,
      routes: routes(context),
      initialRoute: token.isNotEmpty ? homeScreenRoute : logInScreenRoute,
    );
  }
}
