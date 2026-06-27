// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponseBody _$SignupResponseBodyFromJson(Map<String, dynamic> json) =>
    SignupResponseBody(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      gender: json['gender'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$SignupResponseBodyToJson(SignupResponseBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'image': instance.image,
    };
