part of 'calendar_cubit.dart';

class CalendarState {
  final DateTime selectedDate;
  final DateTime getDateTime;
  final DateTime? startDate;
  final RangeSelectionMode rangeSelectionMode;
  final DateTime focusedDay;
  final TextEditingController notes;
  final FocusNode notesFocus;

  const CalendarState({
    required this.selectedDate,
    required this.startDate,
    required this.rangeSelectionMode,
    required this.focusedDay,
    required this.getDateTime,
    required this.notes,
    required this.notesFocus,
  });

  CalendarState copyWith({
    DateTime? selectedDate,
    DateTime? startDate,
    DateTime? endDate,
    RangeSelectionMode? rangeSelectionMode,
    DateTime? focusedDay,
    DateTime? getDateTime,
    TextEditingController? checkIn,
    TextEditingController? checkOut,
    TextEditingController? notes,
    FocusNode? checkInFocus,
    FocusNode? checkOutFocus,
    FocusNode? notesFocus,
    Color? checkInColor,
    Color? checkOutColor,
  }) {
    return CalendarState(
      selectedDate: selectedDate ?? this.selectedDate,
      startDate: startDate ?? this.startDate,
      rangeSelectionMode: rangeSelectionMode ?? this.rangeSelectionMode,
      focusedDay: focusedDay ?? this.focusedDay,
      getDateTime: getDateTime ?? this.getDateTime,
      notes: notes ?? this.notes,
      notesFocus: notesFocus ?? this.notesFocus,
    );
  }
}
