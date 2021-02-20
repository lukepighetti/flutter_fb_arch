/// These firebase service extensions do not import any other firebase services

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import '../constants.dart' show environment;

extension FirebaseStorageX on FirebaseStorage {
  /// An environment specific root reference, ie `/dev`
  Reference rootRef() => ref('$environment');

  /// Upload an avatar for a specific uid
  UploadTask uploadAvatar(String uid, File file) {
    /// TODO: generate an actual UUID
    final filename = 'myavatar';
    final ref = rootRef().child('/users/$uid/avatars/$filename');
    return ref.putFile(file);
  }

  /// Deletes every file that belongs to this user
  Future<void> deleteAllUserFiles(String uid) async {
    final ref = rootRef().child('/users/$uid');
    await ref.delete();
  }
}

extension TaskSnapshotX on TaskSnapshot {
  /// The upload progress from `0.0` to `1.0`
  double get progress => (bytesTransferred / totalBytes).clamp(0.0, 1.0);

  /// If this task completed successfully.
  bool get isComplete => this.state == TaskState.success;

  /// The url to the uploaded file.
  ///
  /// eg, `gs://project-12345.appspot.com/path/to/avatar_image.png`
  String get uploadUrl => 'gs://${storage.bucket}/${ref.fullPath}';
}
