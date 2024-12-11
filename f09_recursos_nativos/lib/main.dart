import 'package:f09_recursos_nativos/firebase/firebase_api.dart';
import 'package:f09_recursos_nativos/provider/places_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/place_form_screen.dart';
import 'screens/places_list_screen.dart';
import 'utils/app_routes.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
    apiKey: 'AIzaSyBqvcEjTpPvyqDmQsFPz-xj_nSRfBPBe_8',
    appId: '1:918234394218:android:29532c5a539ad21a33a413',
    messagingSenderId: '918234394218',
    projectId: 'ddm2024teste',
    storageBucket: 'ddm2024teste.firebasestorage.app',
  )
  );
  await FirebaseApi().initNotificaction();
  await FirebaseApi().setupFlutterNotifications();
  

  runApp(
    
    const MyApp()
    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlacesModel(),
      child: MaterialApp(
        title: 'My Places',
        theme: ThemeData().copyWith(
            colorScheme: ThemeData().colorScheme.copyWith(
                  primary: Colors.indigo,
                  secondary: Colors.amber,
                )),
        home: PlacesListScreen(),
        routes: {
          AppRoutes.PLACE_FORM: (ctx) => PlaceFormScreen(),
        },
      ),
    );
  }
}
