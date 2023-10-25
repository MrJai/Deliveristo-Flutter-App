import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_models.freezed.dart';
part 'application_models.g.dart';

@freezed
class PhotoModel with _$PhotoModel {
  factory PhotoModel({
    required String message,
    required String status,
  }) = _PhotoModel;
  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);
}

@freezed
class ApiResponse with _$ApiResponse {
  factory ApiResponse({
    @Default(500) int? statusCode,
    required dynamic data,
  }) = _ApiResponse;
  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}


PhotoModel photoModelFromJson(String str) => PhotoModel.fromJson(json.decode(str));

String photoModelToJson(PhotoModel data) => json.encode(data.toJson());

class AllBreedsModel {
    Map<String, List<String>> message;
    String status;

    AllBreedsModel({
        required this.message,
        required this.status,
    });

    factory AllBreedsModel.fromJson(Map<String, dynamic> json) => AllBreedsModel(
        message: Map.from(json["message"]).map((k, v) => MapEntry<String, List<String>>(k, List<String>.from(v.map((x) => x)))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": Map.from(message).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
        "status": status,
    };
}
