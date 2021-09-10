import 'package:desafio/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_controller.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  MapController controller = Get.find<MapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondary, width: 2),
        ),
        child: Obx(
          () => GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              zoom: 15,
              target: LatLng(
                controller.userPosition.latitude,
                controller.userPosition.longitude,
              ),
            ),
            onMapCreated: (GoogleMapController _controller) {
              controller.googleMapsController.complete(_controller);
            },
            markers: controller.markers.value,
          ),
        ),
      ),
    );
  }
}
