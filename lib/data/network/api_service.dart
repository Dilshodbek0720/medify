import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:medify/data/models/geocoding/geocoding.dart';
import 'package:medify/data/models/medline/medline_model.dart';
import 'package:medify/data/models/universal_data.dart';
import '../../utils/constants/constants.dart';

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
      response = await _dio.post('/api/user/signup', data: {
        "email": email,
        "password": password,
        "phone_number": phoneNumber,
      }, queryParameters: {
        "verification_method": verificationType
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return UniversalData(
          data: UserModel.fromJson(response.data['user']),
          token: response.data['token']
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
}
