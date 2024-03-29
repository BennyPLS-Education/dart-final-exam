import 'package:examen_final_aguilo/providers/geo_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'providers/providers.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseProvider()),
        ChangeNotifierProvider(create: (_) => Preferences()),
        ChangeNotifierProvider(create: (_) => GeoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase Generic CRUD',
        routes: {
          Login.routeName: (context) => const Login(),
          Home.routeName: (context) => const Home(),
          Details.routeName: (context) => const Details(),
          CreateTree.routeName: (context) => const CreateTree(),
          GeoMap.routeName: (context) => const GeoMap(),
        },
        initialRoute: Login.routeName,
      ),
    );
  }
}
