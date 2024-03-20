
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/network/api_service.dart';

class AuthRepository{
  final ApiService apiService;

  AuthRepository({required this.apiService});

  Future<UniversalData> signUp({required String email, required String password, required String phoneNumber, required String verificationType}) async{
    return apiService.signUp(email: email, password: password, phoneNumber: phoneNumber, verificationType: verificationType);
  }

  Future<UniversalData> resendVerificationToken({required String token, required String verificationMethod}) async{
    return apiService.resendVerificationToken(token: token, verificationMethod: verificationMethod);
  }

  Future<UniversalData> verifyNewAccount({required String token, required int verificationToken}) async{
    return apiService.verifyNewAccount(token: token, verificationToken: verificationToken);
  }
}