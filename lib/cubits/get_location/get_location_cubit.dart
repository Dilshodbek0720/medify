import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

part 'get_location_state.dart';

class GetLocationCubit extends Cubit<GetLocationState> {
  GetLocationCubit() : super(GetLocationInitial()) {
    _getLocation();
  }

  LatLng? latLong;

  Future<void> _getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();

    latLong = LatLng(
      locationData.latitude!,
      locationData.longitude!,
    );

    emit(state);
  }

  updateLatLong(LatLng newLatLng) {
    latLong = newLatLng;
    emit(state);
  }
}
