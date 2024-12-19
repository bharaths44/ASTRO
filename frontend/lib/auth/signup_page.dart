import 'package:astro/auth/utils.dart';
import 'package:astro/core/widgets/login_text_field.dart';
import 'package:astro/core/widgets/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final logger = Logger();
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _shopNameController = TextEditingController();
  final _buildingController = TextEditingController();
  final _roadController = TextEditingController();
  final _landmarkController = TextEditingController();
  final _districtController = TextEditingController();
  final _stateController = TextEditingController();
  final _pincodeController = TextEditingController();

  LatLng? _selectedLocation;
  GoogleMapController? _mapController;

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _shopNameController.dispose();
    _buildingController.dispose();
    _roadController.dispose();
    _landmarkController.dispose();
    _districtController.dispose();
    _stateController.dispose();
    _pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomSheetHeight = screenHeight * 0.3;

    return Scaffold(
      body: Stack(
        children: [
          MapWidget(
            selectedLocation: _selectedLocation,
            onTap: (position) {
              selectLocation(
                position: position,
                onLocationSelected: (LatLng pos) {
                  setState(() {
                    _selectedLocation = pos;
                  });
                },
                districtController: _districtController,
                stateController: _stateController,
              );
            },
            onMapCreated: (controller) {
              _mapController = controller;
              goToCurrentLocation(
                mapController: _mapController,
                onLocationSelected: (LatLng pos) {
                  setState(() {
                    _selectedLocation = pos;
                  });
                },
              );
            },
          ),
          Positioned(
            bottom: bottomSheetHeight + 20,
            right: 10,
            child: Column(
              children: [
                FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    _mapController?.animateCamera(
                      CameraUpdate.zoomIn(),
                    );
                  },
                  child: Icon(Icons.zoom_in),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    _mapController?.animateCamera(
                      CameraUpdate.zoomOut(),
                    );
                  },
                  child: Icon(Icons.zoom_out),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    goToCurrentLocation(
                      mapController: _mapController,
                      onLocationSelected: (LatLng pos) {
                        setState(() {
                          _selectedLocation = pos;
                        });
                      },
                    );
                  },
                  child: Icon(Icons.my_location),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.3,
            maxChildSize: 0.7,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    width: 50,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                LoginTextField(
                                  controller: _firstNameController,
                                  labelText: 'FIRST NAME',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field cannot be empty';
                                    }
                                    return null;
                                  },
                                ),
                                LoginTextField(
                                  controller: _middleNameController,
                                  labelText: 'MIDDLE NAME (OPTIONAL)',
                                ),
                                LoginTextField(
                                  controller: _lastNameController,
                                  labelText: 'LAST NAME',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field cannot be empty';
                                    }
                                    return null;
                                  },
                                ),
                                LoginTextField(
                                  controller: _shopNameController,
                                  labelText: 'SHOP NAME',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field cannot be empty';
                                    }
                                    return null;
                                  },
                                ),
                                LoginTextField(
                                  controller: _buildingController,
                                  labelText: 'BUILDING NAME/NUMBER/FLOOR NO',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field cannot be empty';
                                    }
                                    return null;
                                  },
                                ),
                                LoginTextField(
                                  controller: _roadController,
                                  labelText: 'ROAD/AREA/STREET',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field cannot be empty';
                                    }
                                    return null;
                                  },
                                ),
                                LoginTextField(
                                  controller: _landmarkController,
                                  labelText: 'LANDMARK(OPTIONAL)',
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: LoginTextField(
                                        controller: _districtController,
                                        labelText: 'DISTRICT',
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This field cannot be empty';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: LoginTextField(
                                        controller: _stateController,
                                        labelText: 'STATE',
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This field cannot be empty';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                LoginTextField(
                                  controller: _pincodeController,
                                  labelText: 'PINCODE',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field cannot be empty';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    populateDistrictAndState(
                                      pincodeController: _pincodeController,
                                      districtController: _districtController,
                                      stateController: _stateController,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            saveDetails(
                              formKey: _formKey,
                              firstNameController: _firstNameController,
                              middleNameController: _middleNameController,
                              lastNameController: _lastNameController,
                              shopNameController: _shopNameController,
                              buildingController: _buildingController,
                              roadController: _roadController,
                              landmarkController: _landmarkController,
                              districtController: _districtController,
                              stateController: _stateController,
                              pincodeController: _pincodeController,
                              selectedLocation: _selectedLocation,
                              context: context,
                            );
                          },
                          child: Text('SAVE'),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
