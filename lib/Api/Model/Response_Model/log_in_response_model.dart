// To parse this JSON data, do
//
//     final logInResponseModel = logInResponseModelFromJson(jsonString);

import 'dart:convert';

LogInResponseModel logInResponseModelFromJson(String str) => LogInResponseModel.fromJson(json.decode(str));

String logInResponseModelToJson(LogInResponseModel data) => json.encode(data.toJson());

class LogInResponseModel {
  String status;
  String message;
  Data? data;

  LogInResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LogInResponseModel.fromJson(Map<String, dynamic> json) => LogInResponseModel(
    status: json["status"],
    message: json["message"],
    data: json["data"].length <1? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  int userId;
  String name;

  Data({
    required this.userId,
    required this.name,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "name": name,
  };
}
