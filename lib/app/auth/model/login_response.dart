import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final int? statusCode;
  final bool? feasibilityStatus;
  final String? message;
  final String? data;

  LoginResponse({
    this.statusCode,
    this.feasibilityStatus,
    this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        statusCode: json["statusCode"],
        feasibilityStatus: json["feasibilityStatus"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "feasibilityStatus": feasibilityStatus,
        "message": message,
        "data": data,
      };
}
