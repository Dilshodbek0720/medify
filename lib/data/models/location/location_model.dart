class UserLocationModel{
  final LocationModel locationModel;


  UserLocationModel({
    required this.locationModel,
  });

  UserLocationModel copyWith({
    LocationModel? locationModel,
  }) =>
      UserLocationModel(
        locationModel: locationModel ?? this.locationModel,

      );

  factory UserLocationModel.fromJson(Map<String, dynamic> json) => UserLocationModel(
    locationModel: LocationModel.fromJson(json["location"]),
  );

  Map<String, dynamic> toJson(){
    return {
      "location":locationModel.toJson(),
    };
  }
}

class LocationModel{
  final PointModel pointModel;


  LocationModel({
    required this.pointModel,
  });

  LocationModel copyWith({
    PointModel? pointModel,
  }) =>
      LocationModel(
        pointModel: pointModel ?? this.pointModel,
      );

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    pointModel: PointModel.fromJson(json["Point"]) as PointModel? ?? PointModel(lat: 0, lng: 0),
  );

  Map<String, dynamic> toJson(){
    return {
      "Point":pointModel.toJson(),
    };
  }
}

class PointModel {
  final double lng;
  final double lat;

  PointModel({
    required this.lng,
    required this.lat,
  });

  PointModel copyWith({
    double? lng,
    double? lat,
  }) =>
      PointModel(
        lng: lng ?? this.lng,
        lat: lat ?? this.lat,
      );

  factory PointModel.fromJson(Map<String, dynamic> json) => PointModel(
    lng: json["lng"] as double? ?? 0,
    lat: json["lat"] as double? ?? 0,
  );

  Map<String, dynamic> toJson(){
    return {
      "lng":lng,
      "lat":lat
    };
  }
}
