import 'dart:convert';

class UserLoginResponseModel {
  final String token;
  final String userEmail;
  final String userNiceName;
  final String userDisplayName;

  UserLoginResponseModel({
    required this.token,
    required this.userEmail,
    required this.userNiceName,
    required this.userDisplayName,
  });

  UserLoginResponseModel copyWith({
    String? token,
    String? userEmail,
    String? userNiceName,
    String? userDisplayName,
  }) =>
      UserLoginResponseModel(
        token: token ?? this.token,
        userEmail: userEmail ?? this.userEmail,
        userNiceName: userNiceName ?? this.userNiceName,
        userDisplayName: userDisplayName ?? this.userDisplayName,
      );

  factory UserLoginResponseModel.fromRawJson(String str) => UserLoginResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserLoginResponseModel.fromJson(Map<String, dynamic> json) => UserLoginResponseModel(
    token: json["token"] ?? "",
    userEmail: json["user_email"] ?? "",
    userNiceName: json["user_nicename"] ?? "",
    userDisplayName: json["user_display_name"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user_email": userEmail,
    "user_nicename": userNiceName,
    "user_display_name": userDisplayName,
  };
}
