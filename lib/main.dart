import 'package:flutter/material.dart';
import 'package:timothy/pages/Timothy/timothy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:timothy/widgets/BibleStudySession/bible_study_session.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Ensure that plugin services are initialized so that Firebase can use them
  // This is required for Firebase to work properly
  // before calling runApp

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app
  runApp(const Timothy());
}

class Timothy extends StatelessWidget {
  const Timothy({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BibleStudySession(),
    );
  }
}