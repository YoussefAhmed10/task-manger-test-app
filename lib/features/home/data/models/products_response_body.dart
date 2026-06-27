import 'package:json_annotation/json_annotation.dart';
import 'package:task_manager_test/features/home/data/models/product_model.dart';

part 'products_response_body.g.dart';

@JsonSerializable()
class ProductsResponseBody {
  final List<ProductModel>? products;
  final int? total;
  final int? skip;
  final int? limit;

  ProductsResponseBody({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory ProductsResponseBody.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseBodyToJson(this);
}
