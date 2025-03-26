import 'dart:developer';

import 'package:currency_watch/features/home/data/repos/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../features/home/data/apis/home_api_service.dart';
import '../../features/home/logic/home_cubit.dart';
import '../networking/network/app_constants.dart';
import '../networking/network/base_consumer.dart';
import '../networking/network/dio_consumer.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  /// Register DioConsumer to handle API calls using Dio ///
  final logger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 100,
    logPrint: (object) => log(
      object.toString(),
      name: "Api",
    ),
  );
  final dio = Dio(BaseOptions(
    baseUrl: AppApiConstants.baseUrl,
    receiveDataWhenStatusError: true,
  ));
  dio.interceptors.addAll([logger]);

  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<BaseConsumer>(() => DioConsumer(getIt<Dio>()));


  // FOR Home ///
  getIt.registerLazySingleton<HomeRepo>(() => HomeApiService());
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));
}
