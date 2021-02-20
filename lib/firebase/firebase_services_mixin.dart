import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

/// Makes firebase services easily accessible to [FirebaseUserService] and [Widget]s
mixin FirebaseServices {
  FirebaseApp get app => Firebase.app();
  FirebaseAuth get auth => FirebaseAuth.instance;
  FirebaseDatabase get database => FirebaseDatabase.instance;
  FirebaseStorage get storage => FirebaseStorage.instance;
}
