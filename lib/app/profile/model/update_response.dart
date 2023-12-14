import 'dart:convert';

UpdateProfileResponse updateProfileResponseFromJson(String str) => UpdateProfileResponse.fromJson(json.decode(str));

String updateProfileResponseToJson(UpdateProfileResponse data) => json.encode(data.toJson());

class UpdateProfileResponse {
    final String? id;
    final String? mobile;
    final String? userType;
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

    UpdateProfileResponse({
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

    factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) => UpdateProfileResponse(
        id: json["_id"],
        mobile: json["mobile"],
        userType: json["userType"],
        isVerified: json["isVerified"],
        delFlag: json["delFlag"],
        status: json["status"],
        refreshToken: json["refreshToken"] == null ? [] : List<String>.from(json["refreshToken"]!.map((x) => x)),
        userId: json["userId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "mobile": mobile,
        "userType": userType,
        "isVerified": isVerified,
        "delFlag": delFlag,
        "status": status,
        "refreshToken": refreshToken == null ? [] : List<dynamic>.from(refreshToken!.map((x) => x)),
        "userId": userId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
    };
}
