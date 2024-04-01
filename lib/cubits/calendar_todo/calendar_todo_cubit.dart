import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_todo_state.dart';

class CalendarTodoCubit extends Cubit<CalendarTodoState> {
  CalendarTodoCubit()
      : super(CalendarTodoState(
      selectedDate: DateTime.now(),
      startDate: DateTime.now(),
      getDateTime: DateTime.now(),
      focusedDay: DateTime.now(),
    rangeSelectionMode: RangeSelectionMode.toggledOn,
    endDate: DateTime.now(),));

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
}
