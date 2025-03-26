import 'package:currency_watch/core/networking/network/result.dart';
import 'package:currency_watch/features/home/data/models/currency/currency.dart';

abstract class HomeRepo {
  ///! this method is used to get the currency conversion
  Future<Result<CurrencyModel>> getCurrency({
    required String startDate,
    required String endDate,
    required String currentCurrency,
    required String targetCurrency,
  });
}
