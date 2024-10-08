import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:passwordtest/pages/auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:passwordtest/pages/verify_email_page.dart';
import 'package:passwordtest/utils/utils.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // FirebaseAuth.instance.authStateChanges().listen(authStateChangedHandler);
  // FirebaseAuth.instance.userChanges().listen(userChangedHandler);

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: const MainPage(),
      );
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Something Went Wrong'));
              } else if (snapshot.hasData) {
                return VerifyEmailPage();
              } else {
                return AuthPage();
              }
            }),
      );
}
