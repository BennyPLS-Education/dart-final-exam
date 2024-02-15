import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

// This is a provider to get all the information to get the current location.
class GeoProvider extends ChangeNotifier {
  String? _ip;
  Geo? _geo;
  LatLng? latLng;
  String? organization;

  Future<void> getLatLng() async {
    await _getIP();
    if (_ip == null) {
      latLng = null;
      notifyListeners();
      return;
    }

    await _getGeo();
    if (_geo == null) {
      latLng = null;
      notifyListeners();
      return;
    }

    latLng = _geo!.getLatLng();
    organization = _geo!.org;
    notifyListeners();
  }

  // get ip https://api.ipify.org/?format=json
  Future<void> _getIP() async {
    final uri = Uri.http('api.ipify.org');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      _ip = response.body;
    } else {
      _ip = null;
    }
  }

  // get GEO https://ipinfo.io/188.86.28.212/geo
  Future<void> _getGeo() async {
    final uri = Uri.http('ipinfo.io', '$_ip/geo');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      _geo = Geo.fromJson(response.body);
    } else {
      _geo = null;
    }
  }
}
