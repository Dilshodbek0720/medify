import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit()
      : super(CalendarState(
            selectedDate: DateTime.now(),
            startDate: null,
            getDateTime: DateTime.now(),
            rangeSelectionMode: RangeSelectionMode.toggledOn,
            focusedDay: DateTime.now(),
            notes: TextEditingController(),
            notesFocus: FocusNode()));

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
