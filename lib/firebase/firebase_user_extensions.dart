import 'dart:io';

import 'package:fb_arch/firebase/firebase_services_mixin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'firebase_models.dart';
import 'firebase_database_extensions.dart';
import 'firebase_storage_extensions.dart';

extension FirebaseUserX on User {
  FirebaseUserService get service => FirebaseUserService(this);
}

/// This can be accessed from anywhere in the app with `User.service`
class FirebaseUserService with FirebaseServices {
  FirebaseUserService(this.user);

  final User user;

  /// A stream of my public information.
  Stream<FBUserPublicInfo> myPublicInfo() {
    return database.userPublicInfo(user.uid);
  }

  /// Update my public info
  Future<void> updateMyPublicInfo(FBUserPublicInfo info) {
    return database.updateUserPublicInfo(user.uid, info);
  }

  /// A stream of my private information.
  Stream<FBUserPrivateInfo> myPrivateInfo() {
    return database.userPrivateInfo(user.uid);
  }

  /// Update my avatar.
  UploadTask updateAvatar(File file) {
    final task = storage.uploadAvatar(user.uid, file);

    task.whenComplete(() async {
      await updateMyPublicInfo(FBUserPublicInfo(
        avatarUrl: task.snapshot.uploadUrl,
      ));
    });

    return task;
  }
}
