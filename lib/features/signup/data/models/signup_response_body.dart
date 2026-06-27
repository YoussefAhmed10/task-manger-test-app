import 'package:json_annotation/json_annotation.dart';

part 'signup_response_body.g.dart';

@JsonSerializable()
class SignupResponseBody {
  final int? id;
  final String? username;
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;

  SignupResponseBody({
    this.id,
    this.username,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
  });

  factory SignupResponseBody.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseBodyToJson(this);
}
