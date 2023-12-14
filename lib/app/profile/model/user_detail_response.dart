// To parse this JSON data, do
//
//     final userDetailResponse = userDetailResponseFromJson(jsonString);

import 'dart:convert';

UserDetailResponse userDetailResponseFromJson(String str) =>
    UserDetailResponse.fromJson(json.decode(str));

String userDetailResponseToJson(UserDetailResponse data) =>
    json.encode(data.toJson());

class UserDetailResponse {
  final int? statusCode;
  final bool? feasibilityStatus;
  final String? message;
  final Data? data;

  UserDetailResponse({
    this.statusCode,
    this.feasibilityStatus,
    this.message,
    this.data,
  });

  factory UserDetailResponse.fromJson(Map<String, dynamic> json) =>
      UserDetailResponse(
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
  final dynamic result;
  final List<User>? user;

  Data({
    this.result,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        result: json["result"],
        user: json["user"] == null
            ? []
            : List<User>.from(json["user"]!.map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "user": user == null
            ? []
            : List<dynamic>.from(user!.map((x) => x.toJson())),
      };
}

class User {
  final String? id;
  final String? mobile;
  final UserType? userType;
  final bool? isVerified;
  final bool? delFlag;
  final String? status;
  final List<String>? refreshToken;
  final String? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? email;
  final String? firstName;
  final String? lastName;

  User({
    this.id,
    this.mobile,
    this.userType,
    this.isVerified,
    this.delFlag,
    this.status,
    this.refreshToken,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.email,
    this.firstName,
    this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        mobile: json["mobile"],
        userType: json["userType"] == null
            ? null
            : UserType.fromJson(json["userType"]),
        isVerified: json["isVerified"],
        delFlag: json["delFlag"],
        status: json["status"],
        refreshToken: json["refreshToken"] == null
            ? []
            : List<String>.from(json["refreshToken"]!.map((x) => x)),
        userId: json["userId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "mobile": mobile,
        "userType": userType?.toJson(),
        "isVerified": isVerified,
        "delFlag": delFlag,
        "status": status,
        "refreshToken": refreshToken == null
            ? []
            : List<dynamic>.from(refreshToken!.map((x) => x)),
        "userId": userId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
      };
}

class UserType {
  final String? id;
  final String? typeName;
  final String? description;
  final int? startEnergy;
  final int? endEnergy;
  final bool? isDefaultType;
  final bool? isAutoUpgrade;
  final bool? delFlag;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  UserType({
    this.id,
    this.typeName,
    this.description,
    this.startEnergy,
    this.endEnergy,
    this.isDefaultType,
    this.isAutoUpgrade,
    this.delFlag,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory UserType.fromJson(Map<String, dynamic> json) => UserType(
        id: json["_id"],
        typeName: json["typeName"],
        description: json["description"],
        startEnergy: json["startEnergy"],
        endEnergy: json["endEnergy"],
        isDefaultType: json["isDefaultType"],
        isAutoUpgrade: json["isAutoUpgrade"],
        delFlag: json["delFlag"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "typeName": typeName,
        "description": description,
        "startEnergy": startEnergy,
        "endEnergy": endEnergy,
        "isDefaultType": isDefaultType,
        "isAutoUpgrade": isAutoUpgrade,
        "delFlag": delFlag,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
