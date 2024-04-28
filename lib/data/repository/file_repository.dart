import 'package:file_picker/file_picker.dart';
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/network/api_service.dart';

class FileRepository {
  final ApiService apiService;

  FileRepository({required this.apiService});

  Future<UniversalData> getCustomerFiles({required String token}) async{
    return apiService.getCustomerFiles(token: token);
  }

  Future<UniversalData> createNewFolder({required String token, required String folderName}) async{
    return apiService.createNewFolder(token: token, folderName: folderName);
  }

  Future<UniversalData> getInnerFolderFiles({required String token, required String folderName}) async{
    return apiService.getInnerFolderFiles(token: token, folderName: folderName);
  }

  Future<UniversalData> uploadToInnerFolder({required String token, required String folderName, required PlatformFile file}) async{
    return apiService.uploadToInnerFolder(token: token, folderName: folderName, file: file);
  }
}