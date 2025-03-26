import 'dart:convert';

class CurrencyModel {
  final bool success;
  final String terms;
  final String privacy;
  final bool timeframe;
  final String startDate;
  final String endDate;
  final String source;
  final Map<String, QuotesModel> quotes;

  CurrencyModel({
    required this.success,
    required this.terms,
    required this.privacy,
    required this.timeframe,
    required this.startDate,
    required this.endDate,
    required this.source,
    required this.quotes,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      success: json['success'],
      terms: json['terms'],
      privacy: json['privacy'],
      timeframe: json['timeframe'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      source: json['source'],
      quotes: (json['quotes'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, QuotesModel.fromJson(value)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "terms": terms,
      "privacy": privacy,
      "timeframe": timeframe,
      "start_date": startDate,
      "end_date": endDate,
      "source": source,
      "quotes": quotes.map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}

class QuotesModel {
  final Map<String, double> currencyRates;

  QuotesModel({required this.currencyRates});

  factory QuotesModel.fromJson(Map<String, dynamic> json) {
    return QuotesModel(
      currencyRates: json.map((key, value) => MapEntry(key, (value as num).toDouble())),
    );
  }

  Map<String, dynamic> toJson() {
    return currencyRates;
  }
}

void main() {
  // Example JSON String
  String jsonString = '''
  {
    "success": true,
    "terms": "https://currencylayer.com/terms",
    "privacy": "https://currencylayer.com/privacy",
    "timeframe": true,
    "start_date": "2024-12-29",
    "end_date": "2025-01-01",
    "source": "USD",
    "quotes": {
      "2024-12-29": { "USDEGP": 50.846694 },
      "2024-12-30": { "USDEGP": 50.836604 },
      "2024-12-31": { "USDEGP": 50.836601 },
      "2025-01-01": { "USDEGP": 50.828898 }
    }
  }
  ''';

  // Parsing JSON
  Map<String, dynamic> jsonData = json.decode(jsonString);
  CurrencyModel currencyModel = CurrencyModel.fromJson(jsonData);

  // Printing values
  print(currencyModel.quotes["2024-12-29"]?.currencyRates["USDEGP"]); // Output: 50.846694

  // Converting back to JSON
  String jsonOutput = json.encode(currencyModel.toJson());
  print(jsonOutput);
}
