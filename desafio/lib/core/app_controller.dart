import 'package:objectdb/objectdb.dart';
// ignore: implementation_imports
import 'package:objectdb/src/objectdb_storage_filesystem.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:desafio/core/app_routes.dart';
import 'package:desafio/database/database.dart';
import 'package:desafio/utils/check_permissions.dart';
import 'package:desafio/utils/extensions/user_extension.dart';
import 'package:path_provider/path_provider.dart';

class AppController extends GetxController {
  Position? initialPosition;
  User? user;
  Database? database;
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  void onInit() async {
    await checkPermissions();

    final path = await getExternalStorageDirectory();

    database =
        Database(db: ObjectDB(FileSystemStorage(path!.path + '/app.db')));
    initialPosition = await Geolocator.getCurrentPosition();
    await database!.insertUserLastPosition({
      'lat': initialPosition!.latitude,
      'long': initialPosition!.longitude,
      'saved_at': DateTime.now().toString()
    });
    Get.offAndToNamed(StringRoutes.login);
    super.onInit();
  }

  void setUser(User _user) {
    user = _user;
    Map<String, dynamic> userDoc = _user.toJson();
    database!.insertUser(userDoc);
  }
}
