import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final LatLng? selectedLocation;
  final Function(LatLng) onTap;
  final Function(GoogleMapController) onMapCreated;

  const MapWidget({
    super.key,
    required this.selectedLocation,
    required this.onTap,
    required this.onMapCreated,
  });

  @override
  MapWidgetState createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  GoogleMapController? _controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(8.5241, 76.9366),
            zoom: 15,
          ),
          onMapCreated: (controller) {
            _controller = controller;
            widget.onMapCreated(controller);
          },
          onTap: (position) {
            widget.onTap(position);
            _controller?.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: position,
                  zoom: 15,
                ),
              ),
            );
          },
          markers: widget.selectedLocation != null
              ? {
                  Marker(
                    markerId: MarkerId('selected-location'),
                    position: widget.selectedLocation!,
                  ),
                }
              : {},
        ),
      ),
    );
  }
}
