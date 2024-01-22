import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

initLocationService(BuildContext context) async {
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

  debugPrint("LONGITUDE:${locationData.longitude} AND LAT:${locationData.latitude}");

  location.enableBackgroundMode(enable: true);

  location.onLocationChanged.listen((LocationData newLocation)async
  {
    // LatLng latLng = LatLng(newLocation.latitude!, newLocation.longitude!);
    // context.read<MarkerProvider>().addNewMarker(latLng);
    debugPrint("LONGITUDE:${newLocation.longitude} AND LAT:${locationData.latitude}");
  });
}