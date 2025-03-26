// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:currency_watch/core/helpers/enums.dart';
import 'package:currency_watch/features/home/data/models/currency/currency.dart';

class HomeState {
  final ApiStatus currencyStatus;
  final CurrencyModel? currencyModel;
  final int refreshScreen;

  const HomeState({
    this.currencyStatus = ApiStatus.initial,
    this.currencyModel,
    this.refreshScreen = 0,
  });

  HomeState copyWith({
    ApiStatus? currencyStatus,
    CurrencyModel? currencyModel,
    int? refreshScreen,
  }) {
    return HomeState(
      currencyStatus: currencyStatus ?? this.currencyStatus,
      currencyModel: currencyModel ?? this.currencyModel,
      refreshScreen: refreshScreen ?? this.refreshScreen,
    );
  }
}
