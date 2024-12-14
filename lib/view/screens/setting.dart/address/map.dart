import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rezaqi_ecommerce/controller/sitting/address/address_controller.dart';
import 'package:rezaqi_ecommerce/core/class/handling_data_view.dart';
import 'package:rezaqi_ecommerce/core/class/status_request.dart';
import 'package:rezaqi_ecommerce/core/constant/routs_name.dart';
import 'package:rezaqi_ecommerce/view/widget/custom_button.dart';

import '../../../../controller/sitting/address/add_address_controller.dart';
import '../../../../controller/sitting/address/title_address_controller.dart';
import '../../../../core/funcation/validat.dart';
import '../../../widget/custom_text_form.dart';

/// Map is the Main Application.
class MapLocaltion extends StatefulWidget {
  /// Default Constructor
  const MapLocaltion({super.key});

  @override
  State<MapLocaltion> createState() => _MapLocaltionState();
}

class _MapLocaltionState extends State<MapLocaltion> {
  @override
  Widget build(BuildContext context) {
    AddressControllerImp controller = Get.put(AddressControllerImp());
    AddAddressControllerImp controllerAdd = Get.put(AddAddressControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Add location",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: [
                SizedBox(
                  width: Get.width / 18,
                ),
              ],
            ),
          ),
          ListView(
            children: [
              SizedBox(
                height: Get.height / 30,
              ),
              CustomTextForm(
                colorForm: Color.fromARGB(255, 217, 216, 216),
                hintText: "title",
                myController: controllerAdd.title,
                label: "title",
                showText: false,
                valid: (val) {
                  return validatInput(val!, 1, 50, 'title');
                },
              ),
              SizedBox(
                height: Get.height / 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Chosse location"),
                  Icon(Icons.more_horiz_outlined)
                ],
              ),
              SizedBox(
                height: Get.height / 40,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: Get.height / 2.7,
                  width: Get.width / 1.1,
                  child: GetBuilder<AddressControllerImp>(
                      builder: (controllerPage) {
                    return HandlingDataView(
                        statusRequest: controllerPage.statusRequest,
                        widget: Column(
                          children: [
                            if (controller.KGooglePiex != null)
                              Expanded(
                                child: GoogleMap(
                                  markers: controllerPage.marker.toSet(),
                                  onTap: (latlong) {
                                    controllerPage.addMarker(latlong);
                                  },
                                  mapType: MapType.normal,
                                  initialCameraPosition:
                                      controllerPage.KGooglePiex!,
                                  onMapCreated:
                                      (GoogleMapController controllermap) {
                                    controllerPage.completerCurrent!
                                        .complete(controllermap);
                                  },
                                ),
                              ),
                          ],
                        ));
                  }),
                ),
              ),
              SizedBox(
                height: Get.height / 24,
              ),
              CustomTextForm(
                colorForm: Color.fromARGB(255, 217, 216, 216),
                hintText: "city",
                myController: controllerAdd.city,
                label: "city",
                showText: false,
                valid: (val) {
                  return validatInput(val!, 1, 50, 'title');
                },
              ),
              SizedBox(
                height: Get.height / 55,
              ),
              CustomTextForm(
                colorForm: Color.fromARGB(255, 217, 216, 216),
                hintText: "street",
                myController: controllerAdd.street,
                label: "street",
                showText: false,
                valid: (val) {
                  return validatInput(val!, 1, 50, 'title');
                },
              ),
              SizedBox(
                height: Get.height / 15,
              ),
              CustomButton(
                  hight: 15,
                  ph: 2,
                  borderR: 20,
                  textColor: Colors.white,
                  color: Colors.greenAccent,
                  onPress: () {
                    controllerAdd.addAddress(controller.lat, controller.long);
                  },
                  text: "Save location",
                  fontsize: 20,
                  fontWeight: FontWeight.bold),
            ],
          ),
        ],
      ),
    );
  }
}
