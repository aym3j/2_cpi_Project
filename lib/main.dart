import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/screens/CreateDemande.dart';
import 'package:ii_cpi_project/screens/CreateOffer.dart';
import 'package:ii_cpi_project/screens/Home.dart';
import 'package:ii_cpi_project/screens/LogInUsingPhone.dart';
import 'package:ii_cpi_project/screens/MyDemands.dart';
import 'package:ii_cpi_project/screens/MyOffers.dart';
import 'package:ii_cpi_project/screens/Notifications.dart';
import 'package:ii_cpi_project/screens/Profile.dart';
import 'package:ii_cpi_project/screens/SignUp.dart';
import 'package:ii_cpi_project/screens/Welcom.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Welcom(),
        'home': (context) => Home(),
        'notifications': (context) => Notifications(),
        ProfileScreen.id: (context) => ProfileScreen(),
        CreateOffer.id: (context) => CreateOffer(),
        CreateDemande.id: (context) => CreateDemande(),
        SignUp.id: (context) => SignUp(),
        MyDemands.id: (context) => MyDemands(),
        MyOffers.id: (context) => MyOffers(),
        LogInUsingPhone.id: (context) => LogInUsingPhone(),
      },
    ),
  );
}
