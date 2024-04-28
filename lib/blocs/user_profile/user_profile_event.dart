part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfileEvent {}

class UpdateUserProfile extends UserProfileEvent{

  UpdateUserProfile();
}
class GetUserProfile extends UserProfileEvent{}