import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:new_app/auth/registration.dart';
import 'package:new_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Ensure this is called before runApp()
  runApp(const ColonyForumApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle background message here
  print('Handling a background message: ${message.messageId}');
}

class ColonyForumApp extends StatelessWidget {
  const ColonyForumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colony Forum',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RegistrationPage(),
    );
  }
}
