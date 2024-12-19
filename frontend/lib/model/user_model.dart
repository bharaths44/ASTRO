import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userId;
  final String firstName;
  final String middleName;
  final String lastName;
  final String shopName;
  final String building;
  final String road;
  final String landmark;
  final String district;
  final String state;
  final String pincode;
  final double latitude;
  final double longitude;

  UserModel({
    required this.userId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.shopName,
    required this.building,
    required this.road,
    required this.landmark,
    required this.district,
    required this.state,
    required this.pincode,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'shopName': shopName,
      'building': building,
      'road': road,
      'landmark': landmark,
      'district': district,
      'state': state,
      'pincode': pincode,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      firstName: map['firstName'],
      middleName: map['middleName'],
      lastName: map['lastName'],
      shopName: map['shopName'],
      building: map['building'],
      road: map['road'],
      landmark: map['landmark'],
      district: map['district'],
      state: map['state'],
      pincode: map['pincode'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
      userId: data?['userId'],
      firstName: data?['firstName'],
      middleName: data?['middleName'],
      lastName: data?['lastName'],
      shopName: data?['shopName'],
      building: data?['building'],
      road: data?['road'],
      landmark: data?['landmark'],
      district: data?['district'],
      state: data?['state'],
      pincode: data?['pincode'],
      latitude: data?['latitude'],
      longitude: data?['longitude'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'shopName': shopName,
      'building': building,
      'road': road,
      'landmark': landmark,
      'district': district,
      'state': state,
      'pincode': pincode,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      shopName: json['shopName'],
      building: json['building'],
      road: json['road'],
      landmark: json['landmark'],
      district: json['district'],
      state: json['state'],
      pincode: json['pincode'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'shopName': shopName,
      'building': building,
      'road': road,
      'landmark': landmark,
      'district': district,
      'state': state,
      'pincode': pincode,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}