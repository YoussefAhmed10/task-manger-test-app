import 'package:json_annotation/json_annotation.dart';
import 'package:task_manager_test/features/product_details/data/models/review_model.dart';

part 'product_detail_model.g.dart';

@JsonSerializable()
class ProductDetailModel {
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final String? brand;
  final String? availabilityStatus;
  final String? returnPolicy;
  final List<String>? images;
  final String? thumbnail;
  final List<ReviewModel>? reviews;

  ProductDetailModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.brand,
    this.availabilityStatus,
    this.returnPolicy,
    this.images,
    this.thumbnail,
    this.reviews,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailModelToJson(this);

  String get displayImage =>
      thumbnail ?? (images?.isNotEmpty == true ? images!.first : '');

  double get averageRating {
    final reviewList = reviews;
    if (reviewList == null || reviewList.isEmpty) return 0;
    final total = reviewList.fold<int>(
      0,
      (sum, review) => sum + (review.rating ?? 0),
    );
    return total / reviewList.length;
  }
}
