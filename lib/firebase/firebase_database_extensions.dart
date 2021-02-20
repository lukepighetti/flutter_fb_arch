/// These firebase service extensions do not import any other firebase services

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../constants.dart' show environment;
import '../extensions.dart';
import 'firebase_models.dart';

extension FirebaseDatabaseX on FirebaseDatabase {
  /// An environment specific root reference, ie `/dev`
  @visibleForTesting
  DatabaseReference rootRef() => reference().child('/$environment');

  /// The reference for a user's data
  @visibleForTesting
  DatabaseReference userRef(String uid) => rootRef().child('/users/$uid');

  /// The reference for a user's private data
  @visibleForTesting
  DatabaseReference userPrivateInfoRef(String uid) => userRef(uid).child('prv');

  /// The reference for a user's public data
  @visibleForTesting
  DatabaseReference userPublicInfoRef(String uid) => userRef(uid).child('pub');

  /// A stream of public info about a user.
  Stream<FBUserPublicInfo> userPublicInfo(String uid) {
    return userPublicInfoRef(uid).onValue.map((e) {
      if (e.snapshot.value == null)
        return FBUserPublicInfo();
      else
        return FBUserPublicInfo.fromJson(e.snapshot.value);
    });
  }

  /// Update a user's public info. Only provided values will be updated.
  Future<void> updateUserPublicInfo(String uid, FBUserPublicInfo info) {
    return userPublicInfoRef(uid).update(info.toJson().withoutNullValues);
  }

  /// A stream of private info about a user.
  ///
  /// Only available if the currently logged in user is accessing their
  /// own private information.
  Stream<FBUserPrivateInfo> userPrivateInfo(String uid) {
    return userPrivateInfoRef(uid).onValue.map((e) {
      if (e.snapshot.value == null)
        return FBUserPrivateInfo();
      else
        return FBUserPrivateInfo.fromJson(e.snapshot.value);
    });
  }

  /// Update a user's public info. Only provided values will be updated.
  Future<void> updateUserPrivateInfo(String uid, FBUserPrivateInfo info) {
    return userPrivateInfoRef(uid).update(info.toJson().withoutNullValues);
  }
}
