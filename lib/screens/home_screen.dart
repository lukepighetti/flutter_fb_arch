import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../firebase/firebase.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final privateUserInfo = Provider.of<FBUserPrivateInfo>(context);
    final publicUserInfo = Provider.of<FBUserPublicInfo>(context);

    /// Yadda yadda, do whatever you want with that stuff
    return Container();
  }
}
