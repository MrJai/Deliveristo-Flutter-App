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
