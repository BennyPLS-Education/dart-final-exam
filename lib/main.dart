import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
        // Provider(create: (_) =>
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase Generic CRUD',
        routes: {
          Login.routeName: (context) => const Login(),
          Home.routeName: (context) => const Home(),
          Details.routeName: (context) => const Details(),
          CreateUser.routeName: (context) => const CreateUser(),
        },
        initialRoute: Home.routeName,
      ),
    );
  }
}
