import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:astro/model/user_model.dart';

final logger = Logger();

Future<void> saveDetails({
  required GlobalKey<FormState> formKey,
  required TextEditingController firstNameController,
  required TextEditingController middleNameController,
  required TextEditingController lastNameController,
  required TextEditingController shopNameController,
  required TextEditingController buildingController,
  required TextEditingController roadController,
  required TextEditingController landmarkController,
  required TextEditingController districtController,
  required TextEditingController stateController,
  required TextEditingController pincodeController,
  required LatLng? selectedLocation,
  required BuildContext context,
}) async {
  if (formKey.currentState!.validate()) {
    final user = FirebaseAuth.instance.currentUser;
    final userModel = UserModel(
      userId: user!.uid,
      firstName: firstNameController.text,
      middleName: middleNameController.text,
      lastName: lastNameController.text,
      shopName: shopNameController.text,
      shopLocation:
          '${buildingController.text}, ${roadController.text}, ${landmarkController.text}, ${districtController.text}, ${stateController.text}, ${pincodeController.text}',
      latitude: selectedLocation?.latitude ?? 0.0,
      longitude: selectedLocation?.longitude ?? 0.0,
    );

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.userId)
        .set(userModel.toFirestore());

    if (context.mounted) {
      context.go('/home');
    }
  }
}

Future<void> selectLocation({
  required LatLng position,
  required Function(LatLng) onLocationSelected,
  required TextEditingController districtController,
  required TextEditingController stateController,
}) async {
  onLocationSelected(position);

  List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);
  if (placemarks.isNotEmpty) {
    Placemark placemark = placemarks.first;
    districtController.text = placemark.locality ?? '';
    stateController.text = placemark.subAdministrativeArea ?? '';
  }
}

Future<void> goToCurrentLocation({
  required GoogleMapController? mapController,
  required Function(LatLng) onLocationSelected,
}) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  // Check for location permissions
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  Position position = await Geolocator.getCurrentPosition(
    locationSettings: LocationSettings(accuracy: LocationAccuracy.best),
  );

  mapController?.animateCamera(
    CameraUpdate.newLatLngZoom(
        LatLng(position.latitude, position.longitude), 15),
  );

  onLocationSelected(LatLng(position.latitude, position.longitude));
}

Future<void> populateDistrictAndState({
  required TextEditingController pincodeController,
  required TextEditingController districtController,
  required TextEditingController stateController,
}) async {
  if (pincodeController.text.isNotEmpty) {
    try {
      List<Location> locations =
          await locationFromAddress(pincodeController.text);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        List<Placemark> placemarks = await placemarkFromCoordinates(
            location.latitude, location.longitude);
        if (placemarks.isNotEmpty) {
          Placemark placemark = placemarks.first;
          logger.i(placemark);
          districtController.text = placemark.locality ?? '';
          stateController.text = placemark.administrativeArea ?? '';
        }
      }
    } catch (e) {
      logger.i('Error fetching location: $e');
    }
  }
}
