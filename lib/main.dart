import 'package:flutter/material.dart';
import 'package:timothy/pages/OtherUser/UserProfile/user_profile.dart';
import 'package:timothy/pages/Timothy/Profile/profile_page.dart';
import 'package:timothy/pages/Timothy/timothy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Timothy());
}

class Timothy extends StatelessWidget {
  const Timothy({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserProfile(),
    );
  }
}