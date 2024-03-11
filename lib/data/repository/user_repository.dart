
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/network/api_service.dart';

class UserRepository{
  final ApiService apiService;

  UserRepository({required this.apiService});

  Future<UniversalData> signUp({required String email, required String password, required String phoneNumber, required String verificationType}) async{
    return apiService.signUp(email: email, password: password, phoneNumber: phoneNumber, verificationType: verificationType);
  }
}