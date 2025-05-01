import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Mengecek SharedPreferences untuk status onboarding
  final prefs = await SharedPreferences.getInstance();
  final onboardingCompleted = prefs.getBool('hasSeenOnboarding') ?? false;

  // Mengecek token yang tersimpan
  final storage = FlutterSecureStorage();
  final token = await storage.read(key: 'access_token');

  // Tentukan route awal berdasarkan status onboarding dan token
  String initialRoute;

  if (!onboardingCompleted) {
    initialRoute = '/'; // Onboarding screen jika belum selesai
  } else if (token != null && token.isNotEmpty) {
    initialRoute = '/mainMenu'; // Menu utama jika sudah login dan ada token
  } else {
    initialRoute = '/login'; // Halaman login jika belum ada token
  }

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uncle Tom\'s Barbershop',
      theme: ThemeData.dark(),
      initialRoute: initialRoute, // Route awal yang ditentukan
      routes: {
        '/': (context) => const OnboardingPage(), // Halaman onboarding
        '/login': (context) => const LoginScreen(), // Halaman login
        '/mainMenu': (context) => HomeScreen(), // Halaman utama setelah login
      },
    );
  }
}
