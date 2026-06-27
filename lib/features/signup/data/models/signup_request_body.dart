import 'package:json_annotation/json_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String username;
  final String email;
  final String password;

  SignupRequestBody({
    required this.username,
    required this.email,
    required this.password,
  });

  factory SignupRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
