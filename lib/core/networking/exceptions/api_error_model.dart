class ApiErrorModel {
  int? statusCode;
  dynamic meta;
  bool? isSuccess;
  String? message;
  dynamic errors;
  dynamic data;
  bool? isPagenation;
  dynamic totalCount;
  dynamic idOfAddedObject;

  ApiErrorModel({
    this.statusCode,
    this.meta,
    this.isSuccess,
    this.message,
    this.errors,
    this.data,
    this.isPagenation,
    this.totalCount,
    this.idOfAddedObject,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
        statusCode: json['StatusCode'] as int?,
        meta: json['Meta'] as dynamic,
        isSuccess: json['IsSuccess'] as bool?,
        message: json['Message'] as String?,
        errors: json['Errors'] as dynamic,
        data: json['Data'] as dynamic,
        isPagenation: json['IsPagenation'] as bool?,
        totalCount: json['TotalCount'] as dynamic,
        idOfAddedObject: json['IdOfAddedObject'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'StatusCode': statusCode,
        'Meta': meta,
        'IsSuccess': isSuccess,
        'Message': message,
        'Errors': errors,
        'Data': data,
        'IsPagenation': isPagenation,
        'TotalCount': totalCount,
        'IdOfAddedObject': idOfAddedObject,
      };
}
