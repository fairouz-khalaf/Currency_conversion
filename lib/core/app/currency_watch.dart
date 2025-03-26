import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/extensions.dart';

import '../routing/named_router.dart';

import '../routing/named_router_impl.dart';
import '../theme/app_theme.dart';

class CurrencyWatchApp extends StatelessWidget {
  final AppRouter appRouter;

  const CurrencyWatchApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              themeAnimationDuration: const Duration(milliseconds: 700),
              themeAnimationCurve: Curves.easeInOutCubic,
              onGenerateRoute: appRouter.generateRoute,
              debugShowCheckedModeBanner: false,
              title: 'Currency Watch',
              navigatorKey: NK,
              theme: AppTheme.lightThemeData,
              initialRoute: Routes.homeView
              // Routes.newComplaintsView

              )),
    );
  }
}
