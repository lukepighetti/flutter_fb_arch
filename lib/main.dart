import 'package:fb_arch/screens/home_screen.dart';
import 'package:fb_arch/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart' show appTitle;
import 'firebase/firebase.dart';

void main() async {
  await Firebase.initializeApp();
  final auth = FirebaseAuth.instance;
  final user = await auth.authStateChanges().first;
  final isLoggedInAtLaunch = user != null;

  runApp(
    MultiProvider(
      providers: [
        StreamProvider<User>(
          initialData: user,
          create: (_) => auth.authStateChanges(),
        ),
      ],
      child: MyApp(isLoggedInAtLaunch: isLoggedInAtLaunch),
    ),
  );
}

class MyApp extends StatelessWidget with FirebaseServices {
  const MyApp({Key key, this.isLoggedInAtLaunch}) : super(key: key);

  final bool isLoggedInAtLaunch;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return MultiProvider(
      providers: [
        /// There's a better way to do this, but this gives you the idea
        if (user != null) ...[
          StreamProvider<FBUserPublicInfo>(
            create: (context) => user.service.myPublicInfo(),
          ),
          StreamProvider<FBUserPrivateInfo>(
            create: (context) => user.service.myPrivateInfo(),
          ),
        ],
      ],
      child: MaterialApp(
        title: appTitle,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: isLoggedInAtLaunch ? 'home' : 'login',
        routes: {
          'login': (_) => LoginScreen(),
          'home': (_) => HomeScreen(),
        },
      ),
    );
  }
}
