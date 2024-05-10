import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/network/api_service.dart';

class FavoriteRepository {
  final ApiService apiService;

  FavoriteRepository({required this.apiService});

  Future<UniversalData> getAllFavoriteDoctors({required String token}) async{
    return apiService.getAllFavoriteDoctors(token: token);
  }

  Future<UniversalData> getAllFavoriteHospitals({required String token}) async{
    return apiService.getAllFavoriteHospitals(token: token);
  }

  Future<UniversalData> getAllFavoriteServices({required String token}) async{
    return apiService.getAllFavoriteServices(token: token);
  }

  Future<UniversalData> getBookedDoctorsList({required String token}) async{
    return apiService.getBookedDoctorsList(token: token);
  }

  Future<UniversalData> getBookedServicesList({required String token}) async{
    return apiService.getBookedServicesList(token: token);
  }
}