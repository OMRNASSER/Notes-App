import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_firebase/logic/login/login_bloc.dart';
import 'package:notes_app_firebase/logic/login/login_state.dart';
import 'package:notes_app_firebase/ui/screens/login_screen.dart';
import 'package:notes_app_firebase/ui/screens/new_note.dart';
import 'package:notes_app_firebase/ui/screens/notes_screen.dart';
import 'notification_settings.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance ;
  await messaging.requestPermission();
  String? token = await messaging.getToken();




  print("FCM TOKEN: $token");



  await NotificationService.initialize();
  Timer.periodic(const Duration(seconds: 120), (timer){
    NotificationService.showNotification();
  });
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  User? user = FirebaseAuth.instance.currentUser;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (_)=> LoginBloc(FirebaseAuth.instance, LoginIntialState()),
          child:   LoginScreen()),
    );
  }
}


