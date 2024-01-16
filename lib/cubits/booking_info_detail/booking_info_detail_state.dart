part of 'booking_info_detail_cubit.dart';


class BookingInfoDetailState {
  final TextEditingController fullNameController;
  final TextEditingController nicknameController;
  final TextEditingController dateOfBirthController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final FocusNode fullNameFocusNode;
  final FocusNode nicknameFocusNode;
  final FocusNode dateOfBirthFocusNode;
  final FocusNode phoneFocusNode;
  final FocusNode emailFocusNode;
  final String gender;
  final List<String> genders;
  final Color genderIconColor;
  final Color phoneIconColor;
  final Color emailIconColor;
  final DateTime selectedDate;

  BookingInfoDetailState({
    required this.fullNameController,
    required this.nicknameController,
    required this.dateOfBirthController,
    required this.phoneController,
    required this.emailController,
    required this.fullNameFocusNode,
    required this.nicknameFocusNode,
    required this.dateOfBirthFocusNode,
    required this.phoneFocusNode,
    required this.emailFocusNode,
    required this.gender,
    required this.genders,
    required this.genderIconColor,
    required this.phoneIconColor,
    required this.emailIconColor,
    required this.selectedDate,
  });

  BookingInfoDetailState copyWith({
    TextEditingController? fullNameController,
    TextEditingController? nicknameController,
    TextEditingController? dateOfBirthController,
    TextEditingController? phoneController,
    TextEditingController? emailController,
    FocusNode? fullNameFocusNode,
    FocusNode? nicknameFocusNode,
    FocusNode? dateOfBirthFocusNode,
    FocusNode? phoneFocusNode,
    FocusNode? emailFocusNode,
    String? gender,
    List<String>? genders,
    Color? genderIconColor,
    Color? phoneIconColor,
    Color? emailIconColor,
    DateTime? selectedDate,
    String? file
  }) {
    return BookingInfoDetailState(
      fullNameController: fullNameController ?? this.fullNameController,
      nicknameController: nicknameController ?? this.nicknameController,
      dateOfBirthController: dateOfBirthController ?? this.dateOfBirthController,
      phoneController: phoneController ?? this.phoneController,
      emailController: emailController ?? this.emailController,
      fullNameFocusNode: fullNameFocusNode ?? this.fullNameFocusNode,
      nicknameFocusNode: nicknameFocusNode ?? this.nicknameFocusNode,
      dateOfBirthFocusNode: dateOfBirthFocusNode ?? this.dateOfBirthFocusNode,
      phoneFocusNode: phoneFocusNode ?? this.phoneFocusNode,
      emailFocusNode: emailFocusNode ?? this.emailFocusNode,
      gender: gender ?? this.gender,
      genders: genders ?? this.genders,
      genderIconColor: genderIconColor ?? this.genderIconColor,
      phoneIconColor: phoneIconColor ?? this.phoneIconColor,
      emailIconColor: emailIconColor ?? this.emailIconColor,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }
}
