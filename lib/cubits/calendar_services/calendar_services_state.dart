part of 'calendar_services_cubit.dart';

class CalendarServicesState {
  final DateTime selectedDate;
  final DateTime getDateTime;
  final DateTime? startDate;
  final RangeSelectionMode rangeSelectionMode;
  final DateTime focusedDay;
  final TextEditingController notes;
  final FocusNode notesFocus;
  final int selectHour;
  final FilePickerResult? file;
  final String? image;
  final int selectCall;

  const CalendarServicesState({
    required this.selectedDate,
    required this.startDate,
    required this.rangeSelectionMode,
    required this.focusedDay,
    required this.getDateTime,
    required this.notes,
    required this.notesFocus,
    required this.selectCall,
    required this.selectHour,
    required this.file,
    required this.image,
  });

  CalendarServicesState copyWith({
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
    int? selectHour,
    FilePickerResult? file,
    String? image,
    int? selectCall,
  }) {
    return CalendarServicesState(
      selectedDate: selectedDate ?? this.selectedDate,
      startDate: startDate ?? this.startDate,
      rangeSelectionMode: rangeSelectionMode ?? this.rangeSelectionMode,
      focusedDay: focusedDay ?? this.focusedDay,
      getDateTime: getDateTime ?? this.getDateTime,
      notes: notes ?? this.notes,
      notesFocus: notesFocus ?? this.notesFocus,
      selectHour: selectHour ?? this.selectHour,
      file: file ?? this.file,
      image: image ?? this.image,
      selectCall: selectCall ?? this.selectCall,
    );
  }
}
