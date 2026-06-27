// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestBody _$SignupRequestBodyFromJson(Map<String, dynamic> json) =>
    SignupRequestBody(
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignupRequestBodyToJson(SignupRequestBody instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
    };
