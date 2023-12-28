part of 'register_cubit.dart';

class RegisterState {
  final TextEditingController fullNameController;
  final TextEditingController nicknameController;
  final TextEditingController dateOfBirthController;
  final TextEditingController emailController;
  final FocusNode fullNameFocusNode;
  final FocusNode nicknameFocusNode;
  final FocusNode dateOfBirthFocusNode;
  final FocusNode emailFocusNode;
  final String gender;
  final List<String> genders;
  final Color iconColor;
  final Color iconColor2;
  final DateTime selectedDate;
  final File? file;

  RegisterState({
    required this.fullNameController,
    required this.nicknameController,
    required this.dateOfBirthController,
    required this.emailController,
    required this.fullNameFocusNode,
    required this.nicknameFocusNode,
    required this.dateOfBirthFocusNode,
    required this.emailFocusNode,
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
    TextEditingController? emailController,
    FocusNode? fullNameFocusNode,
    FocusNode? nicknameFocusNode,
    FocusNode? dateOfBirthFocusNode,
    FocusNode? emailFocusNode,
    String? gender,
    List<String>? genders,
    Color? iconColor,
    Color? iconColor2,
    DateTime? selectedDate,
    File? file
  }) {
    return RegisterState(
      fullNameController: fullNameController ?? this.fullNameController,
      nicknameController: nicknameController ?? this.nicknameController,
      dateOfBirthController: dateOfBirthController ?? this.dateOfBirthController,
      emailController: emailController ?? this.emailController,
      fullNameFocusNode: fullNameFocusNode ?? this.fullNameFocusNode,
      nicknameFocusNode: nicknameFocusNode ?? this.nicknameFocusNode,
      dateOfBirthFocusNode: dateOfBirthFocusNode ?? this.dateOfBirthFocusNode,
      emailFocusNode: emailFocusNode ?? this.emailFocusNode,
      gender: gender ?? this.gender,
      genders: genders ?? this.genders,
      iconColor: iconColor ?? this.iconColor,
      iconColor2: iconColor2 ?? this.iconColor2,
      selectedDate: selectedDate ?? this.selectedDate,
      file: file ?? this.file,
    );
  }
}