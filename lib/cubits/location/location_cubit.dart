import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/network/api_service.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({required this.apiService})
      : super(LocationState(
            addresses: [], textController: TextEditingController()));

  final ApiService apiService;

  getAddressByName({required String address}) async {
    UniversalData universalData = await apiService.getAddress(
      address: address,
      kind: state.kind,
      lang: state.lang,
    );

    if (universalData.error.isEmpty) {
      state.addresses = [universalData.data];
      debugPrint(state.addresses.toString());
    } else {
      debugPrint("ERROR:${universalData.error}");
    }
    emit(state.copyWith(addresses:state.addresses));
  }

  void updateKind(String newKind) {
    state.kind = newKind;
  }

  void updateLang(String newLang) {
    state.lang = newLang;
  }

  // bool canSaveAddress() {
  //   if (scrolledAddressText.isEmpty) return false;
  //   if (scrolledAddressText == 'Aniqlanmagan Hudud') return false;
  //   if (scrolledAddressText == 'Undefined Area') return false;
  //   if (scrolledAddressText == 'Неопределенная область') return false;
  //   if (scrolledAddressText == 'Tanımsız Alan') return false;
  //
  //   return true;
  // }
}
