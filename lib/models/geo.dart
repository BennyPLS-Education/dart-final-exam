import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Geo {
  String? ip;
  String? city;
  String? region;
  String? country;
  String? loc;
  String? org;
  String? postal;
  String? timezone;
  String? readme;

  Geo({
    this.ip,
    this.city,
    this.region,
    this.country,
    this.loc,
    this.org,
    this.postal,
    this.timezone,
    this.readme,
  });

  Geo copyWith({
    String? ip,
    String? city,
    String? region,
    String? country,
    String? loc,
    String? org,
    String? postal,
    String? timezone,
    String? readme,
  }) =>
      Geo(
        ip: ip ?? this.ip,
        city: city ?? this.city,
        region: region ?? this.region,
        country: country ?? this.country,
        loc: loc ?? this.loc,
        org: org ?? this.org,
        postal: postal ?? this.postal,
        timezone: timezone ?? this.timezone,
        readme: readme ?? this.readme,
      );

  factory Geo.fromJson(String str) => Geo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Geo.fromMap(Map<String, dynamic> json) => Geo(
        ip: json["ip"],
        city: json["city"],
        region: json["region"],
        country: json["country"],
        loc: json["loc"],
        org: json["org"],
        postal: json["postal"],
        timezone: json["timezone"],
        readme: json["readme"],
      );

  Map<String, dynamic> toMap() => {
        "ip": ip,
        "city": city,
        "region": region,
        "country": country,
        "loc": loc,
        "org": org,
        "postal": postal,
        "timezone": timezone,
        "readme": readme,
      };

  LatLng getLatLng() {
    final split = loc?.split(',');

    if (split?.isEmpty ?? false) {
      return const LatLng(0, 0);
    }

    final double lat = double.parse(split![0]);
    final double lng = double.parse(split[1]);

    return LatLng(lat, lng);
  }
}
