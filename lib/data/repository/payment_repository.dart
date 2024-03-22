import 'package:medify/data/models/credit_card/credit_card.dart';
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/network/api_service.dart';

class PaymentRepository {
  final ApiService apiService;

  PaymentRepository({required this.apiService});

  Future<UniversalData> createCreditCard({required String token, required CreditCardModel creditCardModel}) async{
    return apiService.createCreditCard(token: token, creditCardModel: creditCardModel);
  }

}