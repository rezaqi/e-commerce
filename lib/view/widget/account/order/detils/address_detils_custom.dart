import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressDetils extends StatelessWidget {
  final String city;
  final String name;
  final String street;
  final void Function(GoogleMapController)? onMapCreated;
  final CameraPosition camera;
  final Set<Marker> marker;
  const AddressDetils(
      {super.key,
      required this.city,
      required this.name,
      required this.street,
      required this.onMapCreated,
      required this.camera,
      required this.marker});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.brown[300], borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Shopping Address",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      city,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      street,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.brown, borderRadius: BorderRadius.circular(15)),
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 250,
            child: GoogleMap(
                markers: marker,
                mapType: MapType.normal,
                initialCameraPosition: camera,
                onMapCreated: onMapCreated),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ]),
    );
  }
}
