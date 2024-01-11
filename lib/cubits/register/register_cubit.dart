import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit()
      : super(RegisterState(
          fullNameController: TextEditingController(),
          nicknameController: TextEditingController(),
          dateOfBirthController: TextEditingController(),
          phoneController: TextEditingController(),
          fullNameFocusNode: FocusNode(),
          nicknameFocusNode: FocusNode(),
          dateOfBirthFocusNode: FocusNode(),
          phoneFocusNode: FocusNode(),
          gender: 'Male',
          genders: ["Male", "Female"],
          iconColor: AppColors.c_500,
          iconColor2: AppColors.c_500,
          selectedDate: DateTime.now(),
        )) {
    state.phoneFocusNode.addListener(emailFocusChanged);
  }

  void updateFullName(String fullName) {
    emit(state.copyWith());
  }

  void updateNickname(String nickname) {
    emit(state.copyWith());
  }

  void updateDateOfBirth(String dateOfBirth) {
    emit(state.copyWith(
      dateOfBirthController: state.dateOfBirthController..text = dateOfBirth,
    ));
  }

  void updateSelectedDate(DateTime newDate) {
    emit(state.copyWith(selectedDate: newDate));
  }

  void updatePhone(String phone) {
    Color newIconColor = phone.isNotEmpty
        ? (state.phoneFocusNode.hasFocus ? AppColors.primary : AppColors.c_900)
        : (state.phoneFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(
        phoneController: state.phoneController..text = phone,
        iconColor: newIconColor));
  }

  void emailFocusChanged() {
    Color newIconColor = state.phoneController.text.isNotEmpty
        ? (state.phoneFocusNode.hasFocus ? AppColors.primary : AppColors.c_900)
        : (state.phoneFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(iconColor: newIconColor));
  }

  void updateGender(String gender) {
    emit(state.copyWith(gender: gender, iconColor2: AppColors.c_900));
  }

  void updateFile(String file) {
    emit(state.copyWith(file: file));
  }

  @override
  Future<void> close() {
    state.fullNameController.dispose();
    state.nicknameController.dispose();
    state.phoneController.dispose();
    state.dateOfBirthController.dispose();
    state.fullNameFocusNode.dispose();
    state.nicknameFocusNode.dispose();
    state.phoneFocusNode.dispose();
    state.dateOfBirthFocusNode.dispose();
    return super.close();
  }

  Future<void> showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300.h,
          child: DecoratedBox(
            decoration: const BoxDecoration(
                color: AppColors.c_50,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime(2000),
              minimumDate: DateTime(1950),
              maximumDate: DateTime(2101),
              onDateTimeChanged: (DateTime newDate) {
                if (newDate != state.selectedDate) {
                  state.dateOfBirthController.text =
                      newDate.toLocal().toString().split(' ')[0];
                  updateSelectedDate(newDate);
                  context
                      .read<RegisterCubit>()
                      .updateDateOfBirth(state.dateOfBirthController.text);
                }
              },
            ),
          ),
        );
      },
    );
    if (pickedDate != null &&
        context.mounted &&
        pickedDate != context.read<RegisterState>().selectedDate) {
      context.read<RegisterCubit>().updateSelectedDate(pickedDate);
    }
  }
}
