import 'package:bwi_assignment/firebase_options.dart';
import 'package:bwi_assignment/providers/auth_provider.dart';
import 'package:bwi_assignment/providers/categories_provider.dart';
import 'package:bwi_assignment/providers/offers_provider.dart';
import 'package:bwi_assignment/screens/auth/login_page.dart';
import 'package:bwi_assignment/screens/auth/otp_screen.dart';
import 'package:bwi_assignment/screens/home/home_page.dart';
import 'package:bwi_assignment/screens/splash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kIsWeb) {
    await FirebaseFirestore.instance.enablePersistence();
  } else {
    FirebaseFirestore.instance.settings =
        const Settings(persistenceEnabled: true);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OffersProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
  child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        home: Builder(
          builder: (context) {
            return StreamBuilder<User?>(
              stream: context.read<AuthProvider>().auth.userChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SplashPage();
                } else if (snapshot.hasData && snapshot.data != null) {
                  return const HomePage();
                } else {
                  return const LoginScreen();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
