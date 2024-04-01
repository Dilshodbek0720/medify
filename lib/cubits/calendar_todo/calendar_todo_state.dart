part of 'calendar_todo_cubit.dart';

class CalendarTodoState {
  final DateTime selectedDate;
  final DateTime getDateTime;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime focusedDay;
  final RangeSelectionMode rangeSelectionMode;

  const CalendarTodoState({
    required this.selectedDate,
    required this.startDate,
    required this.endDate,
    required this.focusedDay,
    required this.getDateTime,
    required this.rangeSelectionMode,
  });

  CalendarTodoState copyWith({
    DateTime? selectedDate,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? focusedDay,
    DateTime? getDateTime,
    RangeSelectionMode? rangeSelectionMode,
  }) {
    return CalendarTodoState(
      selectedDate: selectedDate ?? this.selectedDate,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      focusedDay: focusedDay ?? this.focusedDay,
      getDateTime: getDateTime ?? this.getDateTime,
      rangeSelectionMode: rangeSelectionMode ?? this.rangeSelectionMode,
    );
  }
}
