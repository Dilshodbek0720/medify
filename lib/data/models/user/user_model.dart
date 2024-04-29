import 'package:medify/data/models/credit_card/credit_card.dart';
import 'package:medify/data/models/location/location_model.dart';

class UserModel {
  final String email;
  final String password;
  final bool emailVerified;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String birthDay;
  final String gender;
  // final LocationModel location;
  final String accountVerificationOption;
  final String profilePhotoFolder;
  final String profilePhotoNameId;
  final List creditCards;
  final List favoriteDoctors;
  final List favoriteServices;
  final List favoriteHospitals;
  final int verificationToken;
  final String verificationTokenTime;
  final String resetPasswordToken;
  final String resetPasswordTokenTime;
  final String id;
  final List bookedDoctor;
  final String createdAt;
  final String updatedAt;
  final int v;

  UserModel({
    required this.email,
    required this.password,
    required this.emailVerified,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.birthDay,
    required this.gender,
    // required this.location,
    required this.accountVerificationOption,
    required this.profilePhotoFolder,
    required this.profilePhotoNameId,
    required this.creditCards,
    required this.favoriteDoctors,
    required this.favoriteServices,
    required this.favoriteHospitals,
    required this.verificationToken,
    required this.verificationTokenTime,
    required this.resetPasswordToken,
    required this.resetPasswordTokenTime,
    required this.id,
    required this.bookedDoctor,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  UserModel copyWith({
    String? email,
    String? password,
    bool? emailVerified,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? birthDay,
    String? gender,
    // LocationModel? location,
    String? accountVerificationOption,
    String? profilePhotoFolder,
    String? profilePhotoNameId,
    List? creditCards,
    List? favoriteDoctors,
    List? favoriteServices,
    List? favoriteHospitals,
    int? verificationToken,
    String? verificationTokenTime,
    String? resetPasswordToken,
    String? resetPasswordTokenTime,
    String? id,
    List? bookedDoctor,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) =>
      UserModel(
        email: email ?? this.email,
        password: password ?? this.password,
        emailVerified: emailVerified ?? this.emailVerified,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        birthDay: birthDay ?? this.birthDay,
        gender: gender ?? this.gender,
        // location: location ?? this.location,
        accountVerificationOption: accountVerificationOption ?? this.accountVerificationOption,
        profilePhotoFolder: profilePhotoFolder ?? this.profilePhotoFolder,
        profilePhotoNameId: profilePhotoNameId ?? this.profilePhotoNameId,
        creditCards: creditCards ?? this.creditCards,
        favoriteDoctors: favoriteDoctors ?? this.favoriteDoctors,
        favoriteServices: favoriteServices ?? this.favoriteServices,
        favoriteHospitals: favoriteHospitals ?? this.favoriteHospitals,
        verificationToken: verificationToken ?? this.verificationToken,
        verificationTokenTime: verificationTokenTime ?? this.verificationTokenTime,
        resetPasswordToken: resetPasswordToken ?? this.resetPasswordToken,
        resetPasswordTokenTime: resetPasswordTokenTime ?? this.resetPasswordTokenTime,
        id: id ?? this.id,
        bookedDoctor: bookedDoctor ?? this.bookedDoctor,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json["email"] as String? ?? "",
    password: json["password"] as String? ?? "",
    emailVerified: json["email_verified"] as bool? ?? false,
    firstName: json["firstName"] as String? ?? "",
    lastName: json["lastName"] as String? ?? "",
    phoneNumber: json["phoneNumber"] as String? ?? "",
    birthDay: json["birthDay"] as String? ?? "",
    gender: json["gender"] as String? ?? "",
    // location: LocationModel.fromJson(json["location"]) as LocationModel? ?? LocationModel(pointModel: PointModel(lng: 0, lat: 0)),
    accountVerificationOption: json["accountVerificationOption"] as String? ?? "",
    profilePhotoFolder: json["profilePhotoFolder"] as String? ?? "",
    profilePhotoNameId: json["profilePhotoNameId"] as String? ?? "",
    creditCards: (json["creditCards"] as List?)?.map((e) => CreditCardModel.fromJson(e)).toList() ?? [],
    favoriteDoctors: json["favoriteDoctors"] as List? ?? [],
    favoriteServices: json["favoriteServices"] as List? ?? [],
    favoriteHospitals: json["favoriteHospitals"] as List? ?? [],
    verificationToken: json["verification_token"] as int? ?? 0,
    verificationTokenTime: json["verification_token_time"] as String? ?? "",
    resetPasswordToken: json["reset_password_token"] as String? ?? "",
    resetPasswordTokenTime: json["reset_password_token_time"] as String? ?? "",
    id: json["_id"] as String? ?? "",
    bookedDoctor: json["bookedDoctor"] as List? ?? [],
    createdAt: json["createdAt"] as String? ?? "",
    updatedAt: json["updatedAt"] as String? ?? "",
    v: json["__v"] as int? ?? 0,
  );
}