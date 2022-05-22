import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tripma/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const TripMa());
}

class TripMa extends StatelessWidget {
  const TripMa({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'Trip Morocco', home: home());
  }
}
