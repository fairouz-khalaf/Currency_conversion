import 'package:currency_watch/features/home/data/models/currency/usd_egp_price.dart';

class Quotes {
  final Map<String, UsdEgpPrice> quotes;

  Quotes({required this.quotes});

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(
      quotes: (json['quotes'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, UsdEgpPrice.fromJson(value)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "quotes": quotes.map(
        (key, value) => MapEntry(key, value.toJson()),
      ),
    };
  }
}
