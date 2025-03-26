import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../di/dependency_injection.dart';
import '../helpers/bloc_observer.dart';
import '../helpers/shared_preferences.dart';

Future<void> initServices() async {
  await Future.wait<void>(
      [ScreenUtil.ensureScreenSize(), setupGetIt(), SharedPrefHelper.init()]);
  Bloc.observer = MyBlocObserver();
}
