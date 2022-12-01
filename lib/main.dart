import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'config/theme.dart';
import 'cubit/authentication_cubit.dart';
import 'cubit/authentication_state.dart';
import 'cubit/theme_cubit.dart';
import 'data/di/service_locator.dart';
import 'ui/screens/login_screen.dart';
import 'ui/screens/seller_screen.dart';
import 'ui/screens/skeleton_screen.dart';

/// Try using const constructors as much as possible!

void main() async {
  /// Initialize packages
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }
  final Directory tmpDir = await getTemporaryDirectory();
  Hive.init(tmpDir.toString());
  final HydratedStorage storage = await HydratedStorage.build(
    storageDirectory: tmpDir,
  );
  await setup();

  HydratedBlocOverrides.runZoned(
    () => runApp(
      EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const <Locale>[
          Locale('en'),
          Locale('es'),
        ],
        fallbackLocale: const Locale('es'),
        useFallbackTranslations: true,
        child: const MyApp(),
      ),
    ),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (BuildContext context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeModeState>(
        builder: (BuildContext context, ThemeModeState state) {
          return MaterialApp(
            /// Localization is not available for the title.
            title: 'Red Pedidos',

            /// Theme stuff
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state.themeMode,

            /// Localization stuff
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            home: const AuthenticatedApp(),
            // routes: ,
          );
        },
      ),
    );
  }
}

class AuthenticatedApp extends StatelessWidget {
  const AuthenticatedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationCubit>(
      create: (BuildContext context) => AuthenticationCubit(),
      child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (state is AuthenticationAuthenticated) {
            return const SkeletonScreen();
          }
          return const LoginScreen();

          // return const Scaffold(
          //   body: Center(
          //     child: Text('Not authenticated'),
          //   ),
          // );
        },
      ),
    );
  }
}
