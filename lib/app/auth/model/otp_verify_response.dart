import 'dart:convert';

VerifyOtpResponse verifyOtpResponseFromJson(String str) =>
    VerifyOtpResponse.fromJson(json.decode(str));

String verifyOtpResponseToJson(VerifyOtpResponse data) =>
    json.encode(data.toJson());

class VerifyOtpResponse {
  final int? statusCode;
  final bool? feasibilityStatus;
  final String? message;
  final Data? data;

  VerifyOtpResponse({
    this.statusCode,
    this.feasibilityStatus,
    this.message,
    this.data,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) =>
      VerifyOtpResponse(
        statusCode: json["statusCode"],
        feasibilityStatus: json["feasibilityStatus"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "feasibilityStatus": feasibilityStatus,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final String? accessToken;
  final String? refreshToken;
  final bool? isNewUser;
  final String? userId;

  Data({
    this.accessToken,
    this.refreshToken,
    this.isNewUser,
    this.userId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        isNewUser: json["isNewUser"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "isNewUser": isNewUser,
        "userId": userId,
      };
}
