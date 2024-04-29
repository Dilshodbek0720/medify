import 'dart:async';

import 'package:image_picker/image_picker.dart';
import 'package:medify/data/models/location/location_model.dart';
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

  Future<UniversalData> userAccountVerify({required String token, required int verificationToken}) async{
    return apiService.userAccountVerify(token: token, verificationToken: verificationToken);
  }

  Future<UniversalData> completeRegistration({required String token, required String firstName, required String lastName, required String phoneNumber, required String birthDay, required String gender, required XFile file}) async{
    return apiService.completeRegistration(token: token, firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, birthDay: birthDay, gender: gender, file: file);
  }

  Future<UniversalData> updateLocation({required String token, required UserLocationModel userLocationModel}) async{
    return apiService.updateLocation(token: token, userLocationModel: userLocationModel);
  }

  Future<UniversalData> verifyCreditCard({required String token, required int verificationToken}) async{
    return apiService.verifyCreditCard(token: token, verificationToken: verificationToken);
  }
}