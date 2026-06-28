import 'package:json_annotation/json_annotation.dart';

part 'add_product_request_body.g.dart';

@JsonSerializable()
class AddProductRequestBody {
  final String title;
  final String description;
  final String category;
  final double price;
  final String brand;
  final String availabilityStatus;
  final String returnPolicy;

  AddProductRequestBody({
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.brand,
    required this.availabilityStatus,
    required this.returnPolicy,
  });

  factory AddProductRequestBody.fromJson(Map<String, dynamic> json) =>
      _$AddProductRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AddProductRequestBodyToJson(this);
}
