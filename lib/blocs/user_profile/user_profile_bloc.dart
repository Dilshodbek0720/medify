import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:medify/data/local/storage_repository/storage_repository.dart';
import 'package:medify/data/models/location/location_model.dart';
import 'package:medify/data/models/payment/payment_model.dart';
import 'package:medify/data/models/status/form_status.dart';
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/models/user/user_model.dart';
import 'package:medify/data/repository/user_profile_repository.dart';
import 'package:medify/utils/constants/storage_keys.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc({required this.userProfileRepository}) : super(UserProfileState(userModel: UserModel(gender: '',birthDay: '',phoneNumber: '',lastName: '',firstName: '',accountVerificationOption: '',bookedDoctor: [],createdAt: '',creditCards: [],email: '',emailVerified: true,favoriteDoctors: [],favoriteHospitals: [],favoriteServices: [],id: '',password: '',profilePhotoFolder: '',profilePhotoNameId: '',resetPasswordToken: '',resetPasswordTokenTime: '',updatedAt: '',v: 0,verificationToken: 0,verificationTokenTime: '',
      // location: LocationModel(pointModel: PointModel(lat: 0,lng: 0))
  ))) {
    on<GetUserProfile>(getUser);
    add(GetUserProfile());
  }

  final UserProfileRepository userProfileRepository;

  Future<void> getUser(GetUserProfile event, Emitter<UserProfileState> emit) async{
    // emit(state.copyWith(status: FormStatus.loading, statusText: 'Loading...'));
    UniversalData response = await userProfileRepository.getUserProfile(token: StorageRepository.getString(StorageKeys.userToken));
    if (response.error.isEmpty) {
      emit(
        state.copyWith(
          userModel: response.data as UserModel,
        ),
      );
    }
  }

}