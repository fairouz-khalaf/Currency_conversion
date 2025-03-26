import 'package:currency_watch/core/networking/network/network_call.dart';
import 'package:currency_watch/core/networking/network/result.dart';
import 'package:currency_watch/features/home/data/apis/home_api_constant.dart';
import 'package:currency_watch/features/home/data/models/currency/currency.dart';
import 'package:currency_watch/features/home/data/repos/home_repo.dart';

class HomeApiService implements HomeRepo {
  /// this method is used to get the currency conversion from the api
  @override
  Future<Result<CurrencyModel>> getCurrency(
      {required String startDate,
      required String endDate,
      required String currentCurrency,
      required String targetCurrency}) async {
    return await networkCall<CurrencyModel>(
      method: ServerMethods.GET,
      path: HomeApiConstant.getCurrencyConversion,
      params: {
        'start_date': startDate,
        'end_date': endDate,
        'source': "USD",
        'currencies': "EGP",
        'access_key': '688467e13921116aa01fa68c5255d0f5',
      },
      fromJson: (data) => CurrencyModel.fromJson(data),
    );
  }
}
