class SuccessModel {
  int? statusCode;
  dynamic meta;
  bool? isSuccess;
  String? message;
  dynamic errors;
  dynamic data;
  bool? isPagenation;
  dynamic totalCount;
  dynamic idOfAddedObject;

  SuccessModel({
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

  factory SuccessModel.fromJson(Map<String, dynamic> json) => SuccessModel(
        statusCode: json['statusCode'] as int?,
        meta: json['meta'] as dynamic,
        isSuccess: json['isSuccess'] as bool?,
        message: json['message'] as String?,
        errors: json['errors'] as dynamic,
        data: json['data'] as dynamic,
        isPagenation: json['isPagenation'] as bool?,
        totalCount: json['totalCount'] as dynamic,
        idOfAddedObject: json['idOfAddedObject'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'meta': meta,
        'isSuccess': isSuccess,
        'message': message,
        'errors': errors,
        'data': data,
        'isPagenation': isPagenation,
        'totalCount': totalCount,
        'idOfAddedObject': idOfAddedObject,
      };
}
