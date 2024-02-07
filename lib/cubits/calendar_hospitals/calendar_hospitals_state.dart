part of 'calendar_hospitals_cubit.dart';

class CalendarHospitalsState {
  final DateTime selectedDate;
  final DateTime getDateTime;
  final DateTime? startDate;
  final DateTime? endDate;
  final RangeSelectionMode rangeSelectionMode;
  final DateTime focusedDay;
  final TextEditingController checkIn;
  final TextEditingController checkOut;
  final TextEditingController notes;
  final FocusNode checkInFocus;
  final FocusNode checkOutFocus;
  final FocusNode notesFocus;
  final Color checkInColor;
  final Color checkOutColor;

  const CalendarHospitalsState({
    required this.selectedDate,
    required this.startDate,
    required this.endDate,
    required this.rangeSelectionMode,
    required this.focusedDay,
    required this.getDateTime,
    required this.checkIn,
    required this.checkOut,
    required this.notes,
    required this.checkInFocus,
    required this.checkOutFocus,
    required this.notesFocus,
    required this.checkInColor,
    required this.checkOutColor,
  });

  CalendarHospitalsState copyWith({
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
    return CalendarHospitalsState(
      selectedDate: selectedDate ?? this.selectedDate,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      rangeSelectionMode: rangeSelectionMode ?? this.rangeSelectionMode,
      focusedDay: focusedDay ?? this.focusedDay,
      getDateTime: getDateTime ?? this.getDateTime,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      notes: notes ?? this.notes,
      checkInFocus: checkInFocus ?? this.checkInFocus,
      checkOutFocus: checkOutFocus ?? this.checkOutFocus,
      notesFocus: notesFocus ?? this.notesFocus,
      checkInColor: checkInColor ?? this.checkInColor,
      checkOutColor: checkOutColor ?? this.checkOutColor,
    );
  }
}
