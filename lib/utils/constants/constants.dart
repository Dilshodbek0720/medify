import 'package:medify/utils/constants/storage_keys.dart';

const String adminEmail = "admin@gmail.com";

const defaultImageConstant = "Select Image";

const baseUrl = "https://geocode-maps.yandex.ru";
const String apiKey = "1f903bec-cef8-4fed-a745-5556576061f5";

class TimeOutConstants {
  static int connectTimeout = 30;
  static int receiveTimeout = 25;
  static int sendTimeout = 60;
}

const List<String> kindList = [
  "house",
  "metro",
  "district",
  "street",
];

const List<String> langList = [
  "uz_UZ",
  "ru_RU",
  "en_GB",
  "tr_TR",
];

List<String> notificationKeys = [
  StorageKeys.generalNotifications,
  StorageKeys.soundNotifications,
  StorageKeys.vibrateNotifications,
  StorageKeys.specialOffersNotifications,
  StorageKeys.promoDiscountNotifications,
  StorageKeys.paymentsNotifications,
  StorageKeys.cashbackNotifications,
  StorageKeys.appUpdatesNotifications,
  StorageKeys.newServiceAvailableNotifications,
  StorageKeys.newTipsAvailableNotifications,
];

List<bool> notificationValues = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];

List<String> securityKeys = [
  StorageKeys.rememberMeSecurity,
  StorageKeys.faceIdMeSecurity,
  StorageKeys.biometricIdMeSecurity,
];
List<bool> securityValues = [
  false,
  false,
  false,
];