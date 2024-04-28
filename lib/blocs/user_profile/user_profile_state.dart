part of 'user_profile_bloc.dart';

@immutable

class UserProfileState extends Equatable {
  final UserModel userModel;

  const UserProfileState(
      {required this.userModel});

  UserProfileState copyWith({
    UserModel? userModel,
  }) {
    return UserProfileState(
        userModel: userModel ?? this.userModel);
  }

  @override
  List<Object?> get props => [userModel];
}