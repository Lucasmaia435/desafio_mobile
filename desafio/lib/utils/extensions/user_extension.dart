import 'package:firebase_auth/firebase_auth.dart';

extension MapFromUser on User {
  Map<String, dynamic> toJson() => {
        'displayName': displayName,
        'email': email,
        'emailVerified': emailVerified,
        'isAnonymous': isAnonymous,
        'metadata': metadata.toString(),
        'phoneNumber': phoneNumber,
        'photoURL': photoURL,
        'providerData': providerData.toString(),
        'refreshToken': refreshToken,
        'tenantId': tenantId,
        'uid': uid,
      };
}
