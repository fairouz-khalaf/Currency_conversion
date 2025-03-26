import 'package:currency_watch/core/app/currency_watch.dart';
import 'package:currency_watch/core/helpers/shared_preferences.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/app/init_services.dart';
import 'core/routing/named_router_impl.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();
  await initServices();

  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      startLocale: const Locale("en"),
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      child: CurrencyWatchApp(
        appRouter: AppRouter(),
      ),
    ),
  );
  // runApp(DashBoardApp(
  //   appRouter: AppRouter(),
  // ));
}
