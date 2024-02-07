import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_hospitals_state.dart';

class CalendarHospitalsCubit extends Cubit<CalendarHospitalsState> {
  CalendarHospitalsCubit()
      : super(CalendarHospitalsState(
            selectedDate: DateTime.now(),
            startDate: null,
            endDate: null,
            getDateTime: DateTime.now(),
            rangeSelectionMode: RangeSelectionMode.toggledOn,
            focusedDay: DateTime.now(),
            checkIn: TextEditingController(),
            checkOut: TextEditingController(),
            notes: TextEditingController(),
            checkInFocus: FocusNode(),
            checkOutFocus: FocusNode(),
            notesFocus: FocusNode(),
            checkInColor: AppColors.c_500,
            checkOutColor: AppColors.c_500));

  void initializeDateTime(DateTime? getDateTime) {
    emit(state.copyWith(getDateTime: getDateTime));
  }

  void initializeSelectedDate(DateTime? selectedDate) {
    emit(state.copyWith(selectedDate: selectedDate));
  }
  void initializeRanges(DateTime? startDate, DateTime? endDate) {
    emit(state.copyWith(startDate: startDate, endDate: endDate));
  }
  void changeFocusDay(DateTime focusDay) {
    emit(state.copyWith(focusedDay: focusDay));
  }

  void updateCheck(String checkIn, String checkOut) {
    Color checkInColor = checkIn.isNotEmpty
        ? (state.checkInFocus.hasFocus ? AppColors.primary : AppColors.c_900)
        : (state.checkInFocus.hasFocus ? AppColors.primary : AppColors.c_500);
    Color checkOutColor = checkOut.isNotEmpty
        ? (state.checkOutFocus.hasFocus ? AppColors.primary : AppColors.c_900)
        : (state.checkOutFocus.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(
      checkIn: state.checkIn..text = checkIn,
      checkOut: state.checkOut..text = checkOut,
      checkInColor: checkInColor,
      checkOutColor: checkOutColor,
    ));
  }

  void changeSelectionMode(RangeSelectionMode rangeSelectionMode) {
    emit(state.copyWith(rangeSelectionMode: rangeSelectionMode));
  }

  void setCheckInFocus(BuildContext context) {
    Color newIconColor = state.checkIn.text.isNotEmpty
        ? (state.checkInFocus.hasFocus ? AppColors.primary : AppColors.c_900)
        : (state.checkInFocus.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(checkInColor: newIconColor));
// FocusScope.of(context).requestFocus(state.checkInFocus);
  }

  void setCheckOutFocus(BuildContext context) {
    Color newIconColor = state.checkOut.text.isNotEmpty
        ? (state.checkOutFocus.hasFocus ? AppColors.primary : AppColors.c_900)
        : (state.checkOutFocus.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(checkOutColor: newIconColor));
// FocusScope.of(context).requestFocus(state.checkOutFocus);
  }

  void setNotesFocus(BuildContext context) {
    emit(state.copyWith(notesFocus: state.notesFocus));
// FocusScope.of(context).requestFocus(state.notesFocus);
  }

  @override
  Future<void> close() {
    state.checkIn.dispose();
    state.checkOut.dispose();
    state.notes.dispose();
    state.checkInFocus.dispose();
    state.checkOutFocus.dispose();
    state.notesFocus.dispose();
    return super.close();
  }
}
