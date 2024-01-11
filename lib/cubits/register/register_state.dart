part of 'register_cubit.dart';

class RegisterState {
  final TextEditingController fullNameController;
  final TextEditingController nicknameController;
  final TextEditingController dateOfBirthController;
  final TextEditingController phoneController;
  final FocusNode fullNameFocusNode;
  final FocusNode nicknameFocusNode;
  final FocusNode dateOfBirthFocusNode;
  final FocusNode phoneFocusNode;
  final String gender;
  final List<String> genders;
  final Color iconColor;
  final Color iconColor2;
  final DateTime selectedDate;
  final String? file;

  RegisterState({
    required this.fullNameController,
    required this.nicknameController,
    required this.dateOfBirthController,
    required this.phoneController,
    required this.fullNameFocusNode,
    required this.nicknameFocusNode,
    required this.dateOfBirthFocusNode,
    required this.phoneFocusNode,
    required this.gender,
    required this.genders,
    required this.iconColor,
    required this.iconColor2,
    required this.selectedDate,
    this.file,
  });

  RegisterState copyWith({
    TextEditingController? fullNameController,
    TextEditingController? nicknameController,
    TextEditingController? dateOfBirthController,
    TextEditingController? phoneController,
    FocusNode? fullNameFocusNode,
    FocusNode? nicknameFocusNode,
    FocusNode? dateOfBirthFocusNode,
    FocusNode? phoneFocusNode,
    String? gender,
    List<String>? genders,
    Color? iconColor,
    Color? iconColor2,
    DateTime? selectedDate,
    String? file
  }) {
    return RegisterState(
      fullNameController: fullNameController ?? this.fullNameController,
      nicknameController: nicknameController ?? this.nicknameController,
      dateOfBirthController: dateOfBirthController ?? this.dateOfBirthController,
      phoneController: phoneController ?? this.phoneController,
      fullNameFocusNode: fullNameFocusNode ?? this.fullNameFocusNode,
      nicknameFocusNode: nicknameFocusNode ?? this.nicknameFocusNode,
      dateOfBirthFocusNode: dateOfBirthFocusNode ?? this.dateOfBirthFocusNode,
      phoneFocusNode: phoneFocusNode ?? this.phoneFocusNode,
      gender: gender ?? this.gender,
      genders: genders ?? this.genders,
      iconColor: iconColor ?? this.iconColor,
      iconColor2: iconColor2 ?? this.iconColor2,
      selectedDate: selectedDate ?? this.selectedDate,
      file: file ?? this.file,
    );
  }
}