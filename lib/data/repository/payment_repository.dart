import 'package:medify/data/models/credit_card/credit_card.dart';
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/network/api_service.dart';

class PaymentRepository {
  final ApiService apiService;

  PaymentRepository({required this.apiService});

  Future<UniversalData> addCreditCard({required String token, required CreditCardModel creditCardModel}) async{
    return apiService.addCreditCard(token: token, creditCardModel: creditCardModel);
  }

  Future<UniversalData> verifyCreditCard({required String token, required int verificationToken}) async{
    return apiService.verifyCreditCard(token: token, verificationToken: verificationToken);
  }

  Future<UniversalData> resendVerificationToken({required String token, required String verificationMethod}) async{
    return apiService.resendVerificationToken(token: token, verificationMethod: verificationMethod);
  }

  Future<UniversalData> deleteCreditCard({required String token, required int cardId}) async{
    return apiService.deleteCreditCard(token: token, cardId: cardId);
  }

}