import 'package:medify/utils/constants/storage_keys.dart';
import 'package:medify/utils/icons/app_icons.dart';

const String adminEmail = "admin@gmail.com";

const defaultImageConstant = "Select Image";

const baseUrlMap = "https://geocode-maps.yandex.ru";
const baseUrl = "https://workspace-backend-api.onrender.com";
const String apiKey = "1f903bec-cef8-4fed-a745-5556576061f5";

class TimeOutConstants {
  static int connectTimeout = 60;
  static int receiveTimeout = 60;
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

List<String> settingsWidgetKeys = [
  StorageKeys.document,
  StorageKeys.mailServis,
  StorageKeys.calendar,
  StorageKeys.payment,
  StorageKeys.address,
  StorageKeys.fileStorage,
];

List<String> settingsIcons = [
  AppIcons.document,
  AppIcons.message,
  AppIcons.calendar,
  AppIcons.wallet,
  AppIcons.location,
  AppIcons.download,
];

List<bool> settingsWidgetValues = [
  true,
  true,
  true,
  false,
  false,
  false,
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