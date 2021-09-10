import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:desafio/core/app_controller.dart';

class MapController extends GetxController {
  Position userPosition = Get.find<AppController>().initialPosition!;
  Completer<GoogleMapController> _mapController = Completer();

  String? _mapStyle;
  Rx<Set<Marker>> markers = Rx<Set<Marker>>({});

  @override
  void onInit() async {
    markers.value.add(
      Marker(
        markerId: MarkerId('userInit'),
        position: LatLng(userPosition.latitude, userPosition.longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(150),
      ),
    );
    try {
      _mapStyle =
          await rootBundle.loadString('assets/map_styles/dark_style.json');
      final controller = await _mapController.future;

      controller.setMapStyle(_mapStyle);
      await AppController.analytics.logEvent(
        name: 'map_render_succeed_event',
        parameters: <String, dynamic>{
          'message': 'Map render succeed',
          'date': DateTime.now().toString(),
        },
      );
    } catch (e, stack) {
      await FirebaseCrashlytics.instance
          .recordError(e, stack, reason: 'Map render failed');
    }

    print('logEvent succeeded');
    super.onInit();
  }

  String get mapStyle => _mapStyle!;
  Completer<GoogleMapController> get googleMapsController => _mapController;
}
