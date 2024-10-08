import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nsh7nha/components/helper/secure_storage.dart';
import 'package:nsh7nha/generated/l10n.dart';
import 'package:nsh7nha/route/route_constants.dart';
import 'package:nsh7nha/route/router.dart';
import 'package:nsh7nha/screens/home/screens/home_layout/home_cubit/store_cubit.dart';
import 'package:nsh7nha/screens/home/screens/home_layout/home_cubit/store_states.dart';
import 'package:nsh7nha/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SecureStorage().deleteToken();
  String token = await SecureStorage().getToken() ?? '';
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.token});

  final String token;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..get_favorits_car(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
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
            routes: routes(context),
            initialRoute: token.isNotEmpty ? homeScreenRoute : logInScreenRoute,
          );
        },
      ),
    );
  }
}
