// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductRequestBody _$AddProductRequestBodyFromJson(
  Map<String, dynamic> json,
) => AddProductRequestBody(
  title: json['title'] as String,
  description: json['description'] as String,
  category: json['category'] as String,
  price: (json['price'] as num).toDouble(),
  brand: json['brand'] as String,
  availabilityStatus: json['availabilityStatus'] as String,
  returnPolicy: json['returnPolicy'] as String,
);

Map<String, dynamic> _$AddProductRequestBodyToJson(
  AddProductRequestBody instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'category': instance.category,
  'price': instance.price,
  'brand': instance.brand,
  'availabilityStatus': instance.availabilityStatus,
  'returnPolicy': instance.returnPolicy,
};
