import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medify/data/models/add_credit_card/add_credit_card.dart';
import 'package:medify/data/models/file_model/file_model.dart';
import 'package:medify/data/models/geocoding/geocoding.dart';
import 'package:medify/data/models/location/location_model.dart';
import 'package:medify/data/models/resend_verification/resend_verification_model.dart';
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/models/user/user_model.dart';
import '../../utils/constants/constants.dart';
import 'package:http_parser/http_parser.dart';

class ApiService {
  // DIO SETTINGS

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrlMap,
      headers: {
        "Content-Type": "application/json",
        "Authorization": apiKey,
      },
      connectTimeout: Duration(seconds: TimeOutConstants.connectTimeout),
      receiveTimeout: Duration(seconds: TimeOutConstants.receiveTimeout),
      sendTimeout: Duration(seconds: TimeOutConstants.sendTimeout),
    ),
  );

  final _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {"Content-Type": "application/json"},
      connectTimeout: Duration(seconds: TimeOutConstants.connectTimeout),
      receiveTimeout: Duration(seconds: TimeOutConstants.receiveTimeout),
      sendTimeout: Duration(seconds: TimeOutConstants.sendTimeout),
    ),
  );

  ApiService() {
    _init();
  }

  _init() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          //error.response.statusCode
          debugPrint("ERRORGA KIRDI:${error.message} and ${error.response}");
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) async {
          debugPrint("SO'ROV  YUBORILDI :${handler.isCompleted}");
          // return handler.resolve(Response(requestOptions: requestOptions, data: {"name": "ali", "age": 26}));
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          debugPrint("JAVOB  KELDI :${handler.isCompleted}");
          return handler.next(response);
        },
      ),
    );
  }

  Future<UniversalData> getAddress({
    required String address,
    required String kind,
    required String lang,
  }) async {
    Response response;
    try {
      response = await dio.get(
        '/1.x/',
        queryParameters: {
          "apikey": apiKey,
          "geocode": address,
          "lang": lang,
          "format": "json",
          "kind": kind,
          "rspn": "0",
          // "results": "1",
        },
      );

      if (response.statusCode == 200) {
        String text = '';
        if (lang == 'en_GB') {
          text = 'Undefined Area';
        }
        if (lang == 'uz_UZ') {
          text = 'Aniqlanmagan Hudud';
        }
        if (lang == 'ru_RU') {
          text = 'Неопределенная область';
        }
        if (lang == 'tr_TR') {
          text = 'Tanımsız Alan';
        }
        Geocoding geocoding = Geocoding.fromJson(response.data);
        if (geocoding.response.geoObjectCollection.featureMember.isNotEmpty) {
          text = geocoding.response.geoObjectCollection.featureMember[0]
              .geoObject.metaDataProperty.geocoderMetaData.text;
        }
        return UniversalData(data: text);
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  // ------------------- SIGN UP ---------------------

  Future<UniversalData> signUp(
      {required String email,
      required String password,
      required String phoneNumber,
      required String verificationType}) async {
    Response response;
    try {
      response = await _dio.post('/users/registration', data: {
        "email": email,
        "password": password,
        "phone_number": phoneNumber,
      }, queryParameters: {
        "verification_method": verificationType
      });
      if (response.statusCode == 200) {
        return UniversalData(
            data: UserModel.fromJson(response.data['user']),
            token: response.data['token']);
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  // -------------- RESEND-VERIFICATION_TOKEN -------------------

  Future<UniversalData> resendVerificationToken(
      {required String verificationMethod, required String token}) async {
    Response response;
    try {
      response = await _dio.get('/users/resend-verification-token',
          options: Options(headers: {"Authorization": "Bearer $token"}),
          queryParameters: {"verification_method": verificationMethod});
      if (response.statusCode == 200) {
        return UniversalData(
          data: ResendVerificationModel.fromJson(response.data),
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  // ------------------ VERIFY-NEW-ACCOUNT ----------------------

  Future<UniversalData> userAccountVerify(
      {required int verificationToken, required String token}) async {
    Response response;
    try {
      response = await _dio.patch('/users/verify',
          options: Options(headers: {"Authorization": "Bearer $token"}),
          data: {"verification_token": verificationToken});
      if (response.statusCode == 200) {
        return UniversalData(
          data: UserModel.fromJson(response.data),
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  // ------------------ VERIFY-NEW-ACCOUNT ----------------------

  Future<UniversalData> login(
      {required String email, required String password}) async {
    Response response;
    try {
      response = await _dio.get('/users/login',
          data: {"email": email, "password": password});
      if (response.statusCode == 200) {
        return UniversalData(
          token: response.data['token'],
          data: UserModel.fromJson(response.data['user']),
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  // --------------- REGISTER-USER-INFORMATION ------------------

  Future<UniversalData> completeRegistration(
      {required String token,
      required String firstName,
      required String lastName,
      required String phoneNumber,
      required String birthDay,
      required String gender,
      required XFile file}) async {
    Response response;

    try {
      FormData formData = FormData();
      formData.fields.addAll({
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "birthDay": birthDay,
        "gender": gender,
      }.entries.map((entry) => MapEntry(entry.key, entry.value)));
      String fileName = file.path.split('/').last;
      String fileExtension = fileName.split('.').last.toLowerCase();
      String contentType = "image/$fileExtension";
      print("FILE NAME: $fileName");
      print("FIlE EXTENSION: $fileExtension}");
      print("CONTENT TYPE: $contentType");
      formData.files.add(MapEntry(
        "image",
        await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType: MediaType.parse(contentType),
        ),
      ));
      response = await _dio.patch(
        '/users/complete-registration',
        options: Options(
          contentType: "multipart/form-data",
          headers: {
            "Authorization":
            "Bearer $token"
          },
        ),
        data: formData,
      );
      if (response.statusCode == 200) {
        return UniversalData(
          data: UserModel.fromJson(response.data),
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response);
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  // ------------------- UPDATE-LOCATION ----------------------

  Future<UniversalData> updateLocation(
      {required UserLocationModel userLocationModel,
      required String token}) async {
    Response response;
    try {
      response = await _dio.patch('/users/location',
          options: Options(headers: {"Authorization": "Bearer $token"}),
          data: userLocationModel.toJson());
      if (response.statusCode == 200) {
        return UniversalData(
          data: UserModel.fromJson(response.data),
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  // ----------------- CREATE-CREDIT-CARD ------------------------

  Future<UniversalData> addCreditCard(
      {required AddCreditCardModel creditCardModel, required String token}) async {
    Response response;
    try {
      response = await _dio.post('/users/add-credit-card',
          options: Options(headers: {"Authorization": "Bearer $token"}),
          data: {"creditCard": creditCardModel.toJson()});
      if (response.statusCode == 200) {
        return UniversalData(
          data: response.data['message'],
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  //-------------------- GET-USER-PROFILE -------------------------

  Future<UniversalData> getUserProfile(
      {required String token}) async {
    Response response;
    try {
      response = await _dio.get('/users/profile',
          options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        return UniversalData(
          data: UserModel.fromJson(response.data["data"]['profile']),
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  // ----------------------- VERIFY-CREDIT-CARD ----------------------

  Future<UniversalData> verifyCreditCard(
      {required int verificationToken, required String token}) async {
    Response response;
    try {
      response = await _dio.patch('/users/verify-credit-card',
          options: Options(headers: {"Authorization": "Bearer $token"}),
          data: {"verification_token": verificationToken});
      if (response.statusCode == 200) {
        return UniversalData(
          data: UserModel.fromJson(response.data["data"]),
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  // ------------------------ DELETE-CREDIT-CARD ------------------------

  Future<UniversalData> deleteCreditCard(
      {required int cardId, required String token}) async {
    Response response;
    try {
      response = await _dio.delete('/users/delete-credit-card',
          options: Options(headers: {"Authorization": "Bearer $token"}),
          queryParameters: {"card_id": cardId});
      if (response.statusCode == 200) {
        // return UniversalData(
        //   data: UserModel.fromJson(response.data),
        // );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  // ------------------------ GET-CUSTOMER-FILES ---------------------

  Future<UniversalData> getCustomerFiles(
      {required String token}) async {
    Response response;
    try {
      response = await _dio.get('/users/get-my-files',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        return UniversalData(
          data: response.data
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  // ----------------------- CREATE-NEW-FOLDER -------------------------

  Future<UniversalData> createNewFolder(
      {required String token, required String folderName}) async {
    Response response;
    try {
      response = await _dio.post('/users/create-folder',
        data: {'folder_name': folderName},
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        return UniversalData(
          data: response.data['message'],
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  // ------------------- GET-INNER-FOLDER-FILES ---------------------

  Future<UniversalData> getInnerFolderFiles(
      {required String token, required String folderName}) async {
    Response response;
    try {
      response = await _dio.get('/users/get-inner-folder-files',
        queryParameters: {'folder_name':folderName},
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        return UniversalData(
          data: (response.data['files'] as List).map((e) => FileModel.fromJson(e)).toList(),
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  // -------------------- UPLOAD-TO-INNER-FOLDER --------------------------

  Future<UniversalData> uploadToInnerFolder(
      {required String token, required String folderName, required XFile file}) async {
    Response response;
    try {
      String fileName = file.path.split('/').last;
      String fileExtension = fileName.split('.').last.toLowerCase();
      String contentType = "file/$fileExtension";
      FormData formData = FormData.fromMap({
        "file":
        await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType: MediaType.parse(contentType),
        ),
      });
      response = await _dio.post('/users/upload-to-inner-folder',
        queryParameters: {'folder_name':folderName},
        data: formData,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        return UniversalData(
          data: response.data['message'],
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  // -------------------- GET-ALL-FAVORITE-DOCTORS -------------------

  Future<UniversalData> getAllFavoriteDoctors(
      {required String token}) async {
    Response response;
    try {
      response = await _dio.get('/users/get-all-favorite-doctors',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        return UniversalData(
          error: response.data['message'],
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  // -------------------- GET-ALL-FAVORITE-SERVICES -------------------

  Future<UniversalData> getAllFavoriteServices(
      {required String token}) async {
    Response response;
    try {
      response = await _dio.get('/users/get-all-favorite-services',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        return UniversalData(
          error: response.data['message'],
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  // -------------------- GET-ALL-FAVORITE-HOSPITALS -------------------

  Future<UniversalData> getAllFavoriteHospitals(
      {required String token}) async {
    Response response;
    try {
      response = await _dio.get('/users/get-all-favorite-hospitals',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        return UniversalData(
          error: response.data['message'],
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  // -------------------- GET-BOOKED-DOCTORS-LIST -------------------

  Future<UniversalData> getBookedDoctorsList(
      {required String token}) async {
    Response response;
    try {
      response = await _dio.get('/users/get-booked-doctors-list',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        return UniversalData(
          error: response.data['message'],
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  // -------------------- GET-BOOKED-DOCTORS-LIST -------------------

  Future<UniversalData> getBookedServicesList(
      {required String token}) async {
    Response response;
    try {
      response = await _dio.get('/users/get-booked-services-list',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        return UniversalData(
          error: response.data['message'],
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  // ------------------- UPLOAD-FILE-TO-CLOUD --------------------

  Future<UniversalData> uploadFileToCloud(
      {required String token, required XFile file}) async {
    Response response;
    try {
      FormData formData = FormData();
      String fileName = file.path.split('/').last;
      String fileExtension = fileName.split('.').last.toLowerCase();
      String contentType = "file/$fileExtension";
      print("FILE NAME: $fileName");
      print(fileExtension);
      print("Type: $contentType");
      formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType: MediaType.parse(contentType),
        ),
      });
      response = await _dio.post('/users/upload-to-disk',
        data: formData,
        options: Options(
            contentType: "multipart/form-data",
            headers: {"Authorization": "Bearer $token"}),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        return UniversalData(
          data: response.data['message'],
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  // Future<UniversalData> completeRegistration(
  //     {required String token,
  //       required String firstName,
  //       required String lastName,
  //       required String phoneNumber,
  //       required String birthDay,
  //       required String gender,
  //       required XFile file}) async {
  //   Response response;
  //
  //   try {
  //     FormData formData = FormData();
  //     formData.fields.addAll({
  //       "firstName": firstName,
  //       "lastName": lastName,
  //       "phoneNumber": phoneNumber,
  //       "birthDay": birthDay,
  //       "gender": gender,
  //     }.entries.map((entry) => MapEntry(entry.key, entry.value)));
  //     String fileName = file.path.split('/').last;
  //     String fileExtension = fileName.split('.').last.toLowerCase();
  //     String contentType = "image/$fileExtension";
  //     formData.files.add(MapEntry(
  //       "image",
  //       await MultipartFile.fromFile(
  //         file.path,
  //         filename: fileName,
  //         contentType: MediaType.parse(contentType),
  //       ),
  //     ));
  //     response = await _dio.patch(
  //       '/users/complete-registration',
  //       options: Options(
  //         contentType: "multipart/form-data",
  //         headers: {
  //           "Authorization":
  //           "Bearer $token"
  //         },
  //       ),
  //       data: formData,
  //     );
  //     if (response.statusCode == 200) {
  //       return UniversalData(
  //         data: UserModel.fromJson(response.data),
  //       );
  //     }
  //     return UniversalData(error: 'ERROR');
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       print(e.response);
  //       return UniversalData(error: e.response!.data['message']);
  //     } else {
  //       return UniversalData(error: e.message!);
  //     }
  //   } catch (e) {
  //     debugPrint("Caught: $e");
  //     return UniversalData(error: e.toString());
  //   }
  // }

}
