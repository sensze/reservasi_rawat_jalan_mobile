import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:reservasi_rawat_jalan_mobile/bloc_providers.dart';
import 'package:reservasi_rawat_jalan_mobile/core/style/theme.dart';
import 'package:reservasi_rawat_jalan_mobile/locator.dart';

import 'core/gen/codegen_loader.g.dart';
import 'core/routes/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupServiceLocator();
  await dotenv.load(fileName: ".env");
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    EasyLocalization(
      path: 'assets/langs',
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('id', 'ID'),
      ],
      fallbackLocale: const Locale('id', 'ID'),
      assetLoader: const CodegenLoader(),
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MultiBlocProvider(
          providers: BlocProviders.getBlocProviders(),
          child: const MyApp(),
        ),
      ),
    ),
  );
  // child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      routerConfig: AppRouter.createRouter(),
      title: 'Reservasi Rawat Jalan',
      debugShowCheckedModeBanner: false,
      theme: RRJThemeData.lightTheme,
      darkTheme: RRJThemeData.darkTheme,
    );
  }
}
