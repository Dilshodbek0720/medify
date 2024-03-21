import 'dart:async';

import 'package:image_picker/image_picker.dart';
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

  Future<UniversalData> registerUserInformation({required String token, required String firstName, required String lastName, required String phoneNumber, required String birthDay, required String gender, required XFile file}) async{
    return apiService.registerUserInformation(token: token, firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, birthDay: birthDay, gender: gender, file: file);
  }
}