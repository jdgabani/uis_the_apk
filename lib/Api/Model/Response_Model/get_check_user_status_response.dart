// To parse this JSON data, do
//
//     final getCheckUserStatusResponse = getCheckUserStatusResponseFromJson(jsonString);

import 'dart:convert';

GetCheckUserStatusResponse getCheckUserStatusResponseFromJson(String str) => GetCheckUserStatusResponse.fromJson(json.decode(str));

String getCheckUserStatusResponseToJson(GetCheckUserStatusResponse data) => json.encode(data.toJson());

class GetCheckUserStatusResponse {
  String status;
  String message;
  Data data;

  GetCheckUserStatusResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetCheckUserStatusResponse.fromJson(Map<String, dynamic> json) => GetCheckUserStatusResponse(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String status;

  Data({
    required this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}
