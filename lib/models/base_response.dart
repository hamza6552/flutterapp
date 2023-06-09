import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  bool? status;
  dynamic message;
  dynamic data;
  dynamic errors;

  BaseResponse({this.data, this.message, this.status, this.errors});

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

  Map<String, dynamic> dataAsMap() {
    return data as Map<String, dynamic>;
  }

  Map<String, dynamic> errorAsMap() {
    return errors as Map<String, dynamic>;
  }

  String getMessage() {
    if (message is List && (message as List).isNotEmpty) {
      return (message as List)[0];
    } else if (message is String) {
      return message as String;
    }
    return "Unknown";
  }
}
