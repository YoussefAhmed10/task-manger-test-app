import 'package:json_annotation/json_annotation.dart';

part 'user_profile_model.g.dart';

@JsonSerializable()
class UserProfileModel {
  final String? firstName;
  final String? lastName;
  final String? maidenName;
  final String? email;
  final String? image;

  const UserProfileModel({
    this.firstName,
    this.lastName,
    this.maidenName,
    this.email,
    this.image,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);

  String get displayName {
    final parts = [firstName, lastName, maidenName]
        .where((part) => part != null && part.trim().isNotEmpty)
        .map((part) => part!.trim())
        .toList();

    return parts.isEmpty ? 'User' : parts.join(' ');
  }

  String get displayEmail =>
      email?.trim().isNotEmpty == true ? email!.trim() : 'No email available';

  String get imageUrl => image?.trim() ?? '';

  String get initials {
    if (firstName?.isNotEmpty == true && lastName?.isNotEmpty == true) {
      return '${firstName![0]}${lastName![0]}'.toUpperCase();
    }
    if (firstName?.isNotEmpty == true) {
      return firstName![0].toUpperCase();
    }
    if (lastName?.isNotEmpty == true) {
      return lastName![0].toUpperCase();
    }
    return 'U';
  }
}
