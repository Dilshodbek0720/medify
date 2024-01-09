part of 'location_cubit.dart';

class LocationState {
  final TextEditingController textController;

  // String scrolledAddressText = '';
  List addresses;
  String kind = "house";
  String lang = "uz_UZ";

  LocationState({required this.textController, required this.addresses});

  LocationState copyWith(
      {TextEditingController? textController, List? addresses}) {
    return LocationState(
        textController: textController ?? this.textController,
        addresses: addresses ?? this.addresses);
  }
}
