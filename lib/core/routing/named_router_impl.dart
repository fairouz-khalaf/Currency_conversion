import 'package:currency_watch/core/di/dependency_injection.dart';
import 'package:currency_watch/core/routing/named_router.dart';
import 'package:currency_watch/features/home/logic/home_cubit.dart';
import 'package:currency_watch/features/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
//! home
      case Routes.homeView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>()..getCurrency(),
            child: const HomeView(),
          ),
        );

//! default
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
