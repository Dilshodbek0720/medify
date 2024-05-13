import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_services_state.dart';

class CalendarServicesCubit extends Cubit<CalendarServicesState> {
  CalendarServicesCubit()
      : super(CalendarServicesState(
      selectedDate: DateTime.now(),
      startDate: null,
      getDateTime: DateTime.now(),
      rangeSelectionMode: RangeSelectionMode.toggledOn,
      focusedDay: DateTime.now(),
      notes: TextEditingController(),
      selectCall: 0,
      selectHour: -1,
      file: null,
      image: null,
      notesFocus: FocusNode()));

  void initializeDateTime(DateTime? getDateTime) {
    emit(state.copyWith(getDateTime: getDateTime));
  }

  void setSelectHour(int index) {
    emit(state.copyWith(selectHour: index));
  }
  void setSelectCall(int index) {
    emit(state.copyWith(selectCall: index));
  }

  void updateImage(String? path) {
    emit(state.copyWith(image: path));
  }

  void updateFile(FilePickerResult? file) {
    emit(state.copyWith(file: file));
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

  void changeSelectionMode(RangeSelectionMode rangeSelectionMode) {
    emit(state.copyWith(rangeSelectionMode: rangeSelectionMode));
  }

  void setNotesFocus(BuildContext context) {
    emit(state.copyWith(notesFocus: state.notesFocus));
    // FocusScope.of(context).requestFocus(state.notesFocus);
  }

  @override
  Future<void> close() {
    state.notes.dispose();
    state.notesFocus.dispose();
    return super.close();
  }
}
