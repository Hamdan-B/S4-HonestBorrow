import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loan_app/Models/UserObj.dart';
import 'package:loan_app/firebase_options.dart';
import 'package:loan_app/screens/Wrapper.dart';
import 'package:loan_app/services/auth.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserObj?>.value(
      initialData: null,
      value: AuthService().user,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Loan App',
        home: Wrapper(),
      ),
    );
  }
}