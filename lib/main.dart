import 'package:flutter/material.dart';
import 'package:new_app/auth/registration.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const ColonyForumApp());
}

class ColonyForumApp extends StatelessWidget {
  const ColonyForumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Show a loading spinner while Firebase initializes
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        // If there's an error during initialization
        if (snapshot.hasError) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: Text('Error initializing Firebase')),
            ),
          );
        }

        // Firebase is initialized, show the main app
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Colony Forum',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: RegistrationPage(),
        );
      },
    );
  }
}
