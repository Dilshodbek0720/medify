import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/network/api_service.dart';

class UserProfileRepository {
  final ApiService apiService;

  UserProfileRepository({required this.apiService});

  Future<UniversalData> getUserProfile({required String token}) async{
    return apiService.getUserProfile(token: token);
  }
}