

import '../../domain/entites/profile_entity.dart';

class UserProfileModel extends UserProfile {
  UserProfileModel({required String name, required String imageUrl})
      : super(name: name, imageUrl: imageUrl);

  // Convert from JSON to Model
  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  // Convert from Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
    };
  }
}
