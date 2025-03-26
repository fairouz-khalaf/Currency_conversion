class UsdEgpPrice {
  double? usdEgp;

  UsdEgpPrice({this.usdEgp});

  factory UsdEgpPrice.fromJson(Map<dynamic, num> json) => UsdEgpPrice(
        usdEgp: (json['USDEGP'])?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'USDEGP': usdEgp,
      };
}
