import 'package:examen_final_aguilo/providers/geo_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class GeoMap extends StatefulWidget {
  static const routeName = '/geo';

  const GeoMap({super.key});

  @override
  State<GeoMap> createState() => _GeoMapState();
}

class _GeoMapState extends State<GeoMap> {
  @override
  void initState() {
    super.initState();
    final postal = Provider.of<GeoProvider>(context, listen: false);
    postal.getLatLng();
  }

  @override
  Widget build(BuildContext context) {
    final postal = Provider.of<GeoProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Postal Code'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: postal.latLng ?? const LatLng(0, 0),
        ),
        markers: {
          Marker(
            markerId: MarkerId(postal.organization ?? 'Location!'),
            position: postal.latLng ?? const LatLng(0, 0),
          ),
        },
      ),
    );
  }
}
