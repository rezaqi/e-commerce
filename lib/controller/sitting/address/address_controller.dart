import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/class/status_request.dart';
import '../../../core/constant/routs_name.dart';
import '../../../core/funcation/handling.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/address_data.dart';

abstract class AddressController extends GetxController {
  // MyServices myServices = Get.find();

  // TextEditingController title = TextEditingController();
  // TextEditingController city = TextEditingController();
  // TextEditingController street = TextEditingController();
  StatusRequest statusRequest = StatusRequest.loading;

  Completer<GoogleMapController>? completerCurrent;

  double? lat;
  double? long;
  bool? serveries;
  LocationPermission? per;
  Position? position;

  CameraPosition? KGooglePiex;
  List<Marker> marker = [];

  getCurrentPosition();
  addMarker(LatLng latlang);
  initialData();
  //addAddress();
}

class AddressControllerImp extends AddressController {
  @override
  initialData() {
    getCurrentPosition();

    completerCurrent = Completer<GoogleMapController>();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  getCurrentPosition() async {
    statusRequest = StatusRequest.loading;
    update();
    position = await Geolocator.getCurrentPosition().then((value) => value);
    KGooglePiex = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude), zoom: 14);
    addMarker(LatLng(position!.latitude, position!.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  addMarker(latlang) {
    marker.clear();
    marker.add(Marker(markerId: const MarkerId("1"), position: latlang));
    lat = latlang.latitude;
    long = latlang.longitude;
    print("----------------------------");
    print("$lat ");
    print(long);
    update();
  }
}
