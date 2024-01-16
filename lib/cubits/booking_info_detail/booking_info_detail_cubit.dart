import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';

part 'booking_info_detail_state.dart';

class BookingInfoDetailCubit extends Cubit<BookingInfoDetailState> {
  BookingInfoDetailCubit()
      : super(BookingInfoDetailState(
    fullNameController: TextEditingController(),
    nicknameController: TextEditingController(),
    dateOfBirthController: TextEditingController(),
    phoneController: TextEditingController(),
    emailController: TextEditingController(),
    fullNameFocusNode: FocusNode(),
    nicknameFocusNode: FocusNode(),
    dateOfBirthFocusNode: FocusNode(),
    phoneFocusNode: FocusNode(),
    emailFocusNode: FocusNode(),
    gender: 'Male',
    genders: ["Male", "Female"],
    genderIconColor: AppColors.c_500,
    phoneIconColor: AppColors.c_500,
    emailIconColor: AppColors.c_500,
    selectedDate: DateTime.now(),
  )) {
    state.phoneFocusNode.addListener(phoneFocusChanged);
    state.emailFocusNode.addListener(emailFocusChanged);
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

  void updateEmail(String email) {
    Color newIconColor = email.isNotEmpty
        ? (state.emailFocusNode.hasFocus ? AppColors.primary : AppColors.c_900)
        : (state.emailFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(
        emailController: state.emailController..text = email,
        emailIconColor: newIconColor));
  }

  void updatePhone(String phone) {
    Color newIconColor = phone.isNotEmpty
        ? (state.phoneFocusNode.hasFocus ? AppColors.primary : AppColors.c_900)
        : (state.phoneFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(
        phoneController: state.phoneController..text = phone,
        phoneIconColor: newIconColor));
  }

  void emailFocusChanged() {
    Color newIconColor = state.emailController.text.isNotEmpty
        ? (state.emailFocusNode.hasFocus ? AppColors.primary : AppColors.c_900)
        : (state.emailFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(emailIconColor: newIconColor));
  }

  void phoneFocusChanged() {
    Color newIconColor = state.phoneController.text.isNotEmpty
        ? (state.phoneFocusNode.hasFocus ? AppColors.primary : AppColors.c_900)
        : (state.phoneFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(phoneIconColor: newIconColor));
  }

  void updateGender(String gender) {
    emit(state.copyWith(gender: gender, genderIconColor: AppColors.c_900));
  }

  void updateFile(String file) {
    emit(state.copyWith(file: file));
  }

  @override
  Future<void> close() {
    state.fullNameController.dispose();
    state.nicknameController.dispose();
    state.phoneController.dispose();
    state.emailController.dispose();
    state.dateOfBirthController.dispose();
    state.fullNameFocusNode.dispose();
    state.nicknameFocusNode.dispose();
    state.phoneFocusNode.dispose();
    state.emailFocusNode.dispose();
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
                      .read<BookingInfoDetailCubit>()
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
        pickedDate != context.read<BookingInfoDetailState>().selectedDate) {
      context.read<BookingInfoDetailCubit>().updateSelectedDate(pickedDate);
    }
  }
}