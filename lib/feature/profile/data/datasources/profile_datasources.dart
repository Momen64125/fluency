import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entites/profile_entity.dart';
import '../model/profile_model.dart';

abstract class ProfileDatasource {
  Future<UserProfile> getUserProfile();
}

class ProfileDatasourceImpl implements ProfileDatasource {
  final String apiUrl = "https://example.com/api/user";

  @override
  Future<UserProfile> getUserProfile() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return UserProfileModel.fromJson(jsonData); // Using the model for conversion
    } else {
      throw Exception('Failed to load user profile');
    }
  }
}
